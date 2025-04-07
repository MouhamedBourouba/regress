import 'package:flutter/material.dart';
import 'package:regress/domain/repository/user_data_repository.dart';
import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDI();

  final repo = gt.get<StudentRepository>();
  final log = await repo.login("202435347714", "GKptAgmN");
  final data = await repo.getStudentNotes();

  final gg = "gasdg";

  // runApp(RegressApp());
}
