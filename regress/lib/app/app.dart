import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regress/app/providers.dart';
import 'package:regress/ui/providers/auth_provider.dart';
import 'package:regress/ui/screens/home_screen.dart';
import 'package:regress/ui/screens/login_screen.dart';

final brightness = Brightness.light;

final Color primary = Color(0xFF388E3C);
final Color onPrimary = Colors.white;

final Color secondary = Colors.blue;
final Color onSecondary = Colors.black;

final Color error = Color(0xFFD32F2F);
final Color onError = Colors.white;

final Color surface = Colors.white;
final Color onSurface = Colors.black;

class RegressApp extends StatelessWidget {
  const RegressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      child: MaterialApp(
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
          appBarTheme: AppBarTheme(
            backgroundColor: primary,
            foregroundColor: onPrimary,
            elevation: 4,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: onPrimary,
            ),
          ),
        ),
        themeMode: ThemeMode.light,
        home: Builder(builder: (context) {
          return context.read<AuthProvider>().checkAuthentication() ? HomeScreen() : LoginScreen();
        }),
      ),
    );
  }
}
