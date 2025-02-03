import 'package:flutter/widgets.dart';
import 'package:regress/app/app.dart';

import 'app/di.dart';

void main() async {
  await configureDI();
  runApp(const RegessApp());
}

