import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regress/app/providers.dart';
import 'package:regress/ui/providers/auth_provider.dart';
import 'package:regress/ui/screens/home_screen.dart';
import 'package:regress/ui/screens/login_screen.dart';

final brightness = Brightness.light;

final Color primary = Colors.green;
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
      ),
      themeMode: ThemeMode.light,
      home: AppProviders(
        child: Builder(builder: (context) {
          return context.read<AuthProvider>().checkAuthentication()
              ? HomeScreen()
              : LoginScreen();
        }),
      ),
    );
  }
}
