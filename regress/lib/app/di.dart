import 'package:get_it/get_it.dart';
import 'package:regress/ui/providers/auth_provider.dart';
import 'package:regress/progress_api.dart';
import 'package:result_dart/result_dart.dart';

import '../models/auth_request_entity.dart';
import '../models/auth_response_entity.dart';

final gt = GetIt.instance;

abstract class ProgressAPI {
  Future<ResultDart<AuthResponseEntity, String>> login(AuthRequestEntity authReq);
}

Future<void> configureDI() async {
  gt.registerSingleton<ProgressAPI>(ProgressAPIImpl());
  gt.registerSingleton(AuthProvider(gt.get()));
}
