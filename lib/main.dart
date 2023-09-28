import 'package:api_bloc/config/DI/dependencies_config.dart';
import 'package:api_bloc/config/routes/app_router.dart';
import 'package:api_bloc/config/themes/themes.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppThemes().appThemeData,
      routerConfig: getIt<AppRouter>().config(),
      // TODO: ກຳນົດ Config router ໃຫ້ class AppRouter ໃຫ້ເປັນຫນ້າເລີ່ມຕົ້ນ
    );
  }
}
