import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/modules/onboarding/views/onboarding_view.dart';
import 'package:open_close_loop_recycling/app/modules/signup/views/signup_view.dart';
import 'package:open_close_loop_recycling/app/modules/splash/views/splash_view.dart';

class AppRoutes {
  static String INITIAL_ROUTE = "/";
  static String ON_BOARDINGVIEW_ROUTE = "/on-boarding-route";
  static String SIGNUP_ROUTE = "/sign-up-route";
  static List<GetPage> routes = [
    GetPage(
      name: INITIAL_ROUTE,
      page: () => const SplashView(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: ON_BOARDINGVIEW_ROUTE,
      page: () => const OnboardingView(),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: SIGNUP_ROUTE,
      page: () => const SignupView(),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
