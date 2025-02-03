import 'package:get_it/get_it.dart';
import 'package:regress/data/repositorys/auth_repository.dart';
import 'package:regress/data/repositorys/user_repository.dart';
import 'package:regress/data/sources/progress_api.dart';
import 'package:regress/domain/repository/auth_repository.dart';
import 'package:regress/domain/repository/user_data_repository.dart';
import 'package:regress/ui/providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final gt = GetIt.instance;

Future<void> configureDI() async {
  // SOURCES
  final sp = await SharedPreferences.getInstance();
  gt.registerSingleton(sp);
  gt.registerSingleton(ProgressAPI());

  // REPOSITORY'S
  gt.registerSingleton<AuthRepository>(AuthRepositoryImpl(gt.get(), gt.get()));
  gt.registerSingleton<UserRepository>(UserRepositoryImpl(gt.get(), gt.get(), gt.get()));

  // PROVIDERS
  gt.registerSingleton(AuthProvider(gt.get()));
}
