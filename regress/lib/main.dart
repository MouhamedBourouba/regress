import 'package:flutter/widgets.dart';
import 'package:regress/app/app.dart';
import 'package:regress/data/sources/progress_api.dart';
import 'package:regress/domain/repository/user_data_repository.dart';

import 'app/di.dart';



void main() async {
  await configureDI();
  ProgressAPI pa = gt.get();
  UserRepository ur = gt.get();

  runApp(const RegessApp());
}
