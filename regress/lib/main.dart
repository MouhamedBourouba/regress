import 'package:regress/data/sources/progress_api.dart';
import 'package:regress/domain/repository/auth_repository.dart';
import 'package:regress/domain/repository/user_data_repository.dart';

import 'app/di.dart';

void main() async {
  await configureDI();
  final AuthRepository auth = gt.get();
  final UserRepository user = gt.get();
  final ProgressAPI api = gt.get();
  final data = await user.getStudentData();
}