import 'package:get_it/get_it.dart';
import 'package:regress/data/repositorys/auth_repository.dart';
import 'package:regress/data/sources/progress_api.dart';
import 'package:regress/domain/repository/auth_repository.dart';
import 'package:regress/ui/providers/auth_provider.dart';

final gt = GetIt.instance;

Future<void> configureDI() async {
  // SOURCES
  gt.registerSingleton(ProgressAPI());

  // REPOSITORY'S
  gt.registerSingleton<AuthRepository>(AuthRepositoryImpl(gt.get()));

  // PROVIDERS
  gt.registerSingleton(AuthProvider(gt.get()));
}
