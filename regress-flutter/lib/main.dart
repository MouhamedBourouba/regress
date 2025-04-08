import 'package:flutter/material.dart';
import 'package:regress/domain/repository/user_data_repository.dart';
import 'app/app.dart';
import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDI();

  runApp(RegressApp());
}
