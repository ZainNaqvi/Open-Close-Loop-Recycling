import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/modules/splash/views/splash_view.dart';

class AppRoutes {
  static String INITIAL_ROUTE = "/";
  static List<GetPage> routes = [
    GetPage(
      name: INITIAL_ROUTE,
      page: () => const SplashView(),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
