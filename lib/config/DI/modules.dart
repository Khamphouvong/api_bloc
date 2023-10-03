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

// TODO: RegisterModule  ນີ້ຈະໃຊ້ໃນຂະບວນການ Dependency Injection ເພື່ອໃຫ້ສາມາດເອີ້ນໃຊ້ຄາສ 
//Dio ແລະ AppRouter ໃນສ່ວນອື່ນໆຂອງແອບພິເຄຊັ່ນໄດ້ຢ່າງສະດວກ ແລະ ມີຄວາມຍືດຫຍູນສູງ