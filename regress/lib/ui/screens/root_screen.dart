import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:regress/ui/providers/auth_provider.dart';
import 'package:regress/ui/screens/home_screen.dart';
import 'package:regress/ui/screens/login_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return context.read<AuthProvider>().checkAuthentication() ? HomeScreen() : LoginScreen();
  }
}
