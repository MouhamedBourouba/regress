import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'auth_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Regress',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E5EAA),  // Professional deep blue
          brightness: Brightness.light,
          secondary: const Color(0xFF4CAF50),  // Positive green for progress
          surface: Colors.white,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',  // Clean, readable font

        // Text Theme
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontSize: 16, height: 1.5),  // Optimal reading size
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),

        // Component Themes
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E5EAA),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          filled: true,
          fillColor: Colors.grey[50],
          contentPadding: const EdgeInsets.all(16),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 1,
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),

        cardTheme: CardTheme(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade100, width: 1),
          ),
        ),

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E5EAA),
          brightness: Brightness.dark,
          secondary: const Color(0xFF4CAF50),
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      themeMode: ThemeMode.light,  // Force light mode for focus
      home: AppProviders(
        child: const LoginScreen(),
      ),
    );  }
}

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: child,
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: const Text("LOGIN", style: TextStyle(fontSize: 16)),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  InputDecoration buildInputDecoration(String placeholder, Icon icon) {
    return InputDecoration(
      hintText: placeholder,
      icon: icon,
      filled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (authProvider.errorMessage != null && !authProvider.hasShownError) {
      SchedulerBinding.instance.addPostFrameCallback(
        (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(authProvider.errorMessage!),
              backgroundColor: Theme.of(context).colorScheme.error,
              duration: Duration(seconds: 3),
            ),
          );
          authProvider.errorShown();
        },
      );
    }

    if (authProvider.loading) {
    } else {}

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: authProvider.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: buildInputDecoration(
                      "Registration number",
                      Icon(Icons.account_box),
                    ),
                    onChanged: context.read<AuthProvider>().onRegistrationNumberChanged,
                    validator: authProvider.validate,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: buildInputDecoration(
                      "Password",
                      Icon(Icons.lock),
                    ),
                    obscureText: true,
                    onChanged: context.read<AuthProvider>().onPasswordChanged,
                    validator: authProvider.validate,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: authProvider.onButtonClick(),
                    child: const Text("LOGIN", style: TextStyle(fontSize: 16)),
                  )
                ],
              ),
            ),
          ),
          if (authProvider.loading)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: Colors.black54,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 20),
                        Text("Loading..."),
                      ],
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
