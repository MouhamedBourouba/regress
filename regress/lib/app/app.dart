import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regress/app/di.dart';
import 'package:regress/app/providers.dart';
import 'package:regress/domain/repository/user_data_repository.dart';
import 'package:regress/ui/providers/auth_provider.dart';
import 'package:regress/ui/providers/user_provider.dart';
import 'package:regress/ui/screens/home_screen.dart';
import 'package:regress/ui/screens/login_screen.dart';

final brightness = Brightness.light;

final Color primary = Color(0xFF1565C0);
final Color onPrimary = Colors.white;

final Color secondary = Color(0xFFFFC107);
final Color onSecondary = Colors.black;

final Color error = Color(0xFFD32F2F);
final Color onError = Colors.white;

final Color surface = Colors.white12;
final Color onSurface = Colors.black87;

class RegessApp extends StatelessWidget {
  const RegessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Regress',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: brightness,
          primary: primary,
          onPrimary: onPrimary,
          secondary: secondary,
          onSecondary: onSecondary,
          error: error,
          onError: onError,
          surface: surface,
          onSurface: onSurface,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(fontSize: 16, height: 1.5), // Optimal reading size
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: Colors.white,
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
      themeMode: ThemeMode.light,
      home: AppProviders(
        child: Builder(builder: (context)  {
          final up = gt.get<UserRepository>();
          return context.read<AuthProvider>().checkAuthentication() ? StudentProfileScreen() : LoginScreen();
        }),
      ),
    );
  }
}
