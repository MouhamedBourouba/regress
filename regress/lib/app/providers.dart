import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:regress/app/di.dart';
import 'package:regress/ui/providers/auth_provider.dart';
import 'package:regress/ui/providers/user_provider.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => gt.get()),
        ChangeNotifierProvider<UserProvider>(create: (_) => gt.get()),
      ],
      child: child,
    );
  }
}
