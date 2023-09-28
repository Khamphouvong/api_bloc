import 'package:auto_route/auto_route.dart';

import '../../features/daily_news/presentation/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        //
        // TODO: ຂຽນໂຄດໃນ "AutoRoute(page: HomeRoute.page, initial: true)", ເພື່ອ GENERATED file  app_router.gr.dart
      ];
}
