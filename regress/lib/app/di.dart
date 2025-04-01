import 'package:get_it/get_it.dart';
import 'package:regress/data/repository/user_repository.dart';
import 'package:regress/data/sources/local_image_cache.dart';
import 'package:regress/data/sources/progress_api.dart';
import 'package:regress/domain/repository/user_data_repository.dart';
import 'package:regress/ui/providers/auth_provider.dart';
import 'package:regress/ui/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final gt = GetIt.instance;

Future<void> configureDI() async {
  // SOURCES
  final sp = await SharedPreferences.getInstance();
  gt.registerSingleton(sp);
  gt.registerSingleton(ProgressAPI());
  gt.registerSingleton(Base64LocalImageCache(gt.get()));

  gt.registerSingleton<StudentRepository>(UserRepositoryImpl(gt.get(), gt.get(), gt.get()));

  // PROVIDERS
  gt.registerSingleton(AuthProvider(gt.get()));
  gt.registerSingleton(UserProvider(gt.get()));
}
