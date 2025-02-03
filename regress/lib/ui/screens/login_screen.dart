import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:regress/ui/providers/auth_provider.dart';

final maxFormWidth = 500.0;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    if (authProvider.errorMessage != null && !authProvider.hasShownError) {
      SchedulerBinding.instance.addPostFrameCallback(
        (_) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar(reason: SnackBarClosedReason.timeout);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(authProvider.errorMessage!),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
          authProvider.errorShown();
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxFormWidth),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MediaQuery.of(context).size.width > maxFormWidth
                    ? Card(
                        elevation: 10,
                        child: Padding(
                            padding: const EdgeInsets.only(bottom: 28, left: 16, right: 16),
                            child: _LoginForm()),
                      )
                    : _LoginForm(),
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
                        Text("Login in..."),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return IntrinsicHeight(
      child: Form(
        key: authProvider.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/uni_logo.png",
              height: 160,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Registration number",
                icon: Icon(Icons.account_box),
              ),
              onChanged: authProvider.onRegistrationNumberChanged,
              validator: authProvider.validateRegistrationNumber,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Password",
                icon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: authProvider.onVisibilityClicked,
                  icon:
                      authProvider.visibility ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                ),
              ),
              obscureText: authProvider.visibility,
              onChanged: authProvider.onPasswordChanged,
              validator: authProvider.validatePassword,
            ),
            const SizedBox(height: 16),
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
    );
  }
}
