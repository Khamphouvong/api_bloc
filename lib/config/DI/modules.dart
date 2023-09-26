import 'package:api_bloc/config/routes/app_router.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio();
    dio.options.connectTimeout = const Duration(seconds: 30);
    return dio;
  }

  @lazySingleton
  AppRouter appRouter() => AppRouter();
}
