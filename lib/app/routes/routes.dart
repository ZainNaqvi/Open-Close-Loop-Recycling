import 'package:get/get.dart';
import '../modules/fogot/forgot.dart';
import '../modules/home/home_view.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/signup/signup_view.dart';
import '../modules/splash/splash_view.dart';

class AppRoutes {
  // App - Routes - String
  static const INITIAL_ROUTE = '/';
  static const ONBOARDING_ROUTE = '/onboarding';
  static const HOME_ROUTE = '/home';
  static const SIGNUP_ROUTE = '/signup';
  static const FORGOT_PASSWORD_ROUTE = '/forgot-password';
  // App - Routes - Navigation
  static final ROUTES = [
    // Splash - View - Widget
    GetPage(
      name: INITIAL_ROUTE,
      page: () => const SplashView(),
      transition: Transition.leftToRightWithFade,
    ),
    // Onboarding - View - Widget
    GetPage(
      name: ONBOARDING_ROUTE,
      page: () => const OnboardingView(),
      transition: Transition.leftToRightWithFade,
    ),
    // Home - View - Widget
    GetPage(
      name: HOME_ROUTE,
      page: () => const HomeView(),
      transition: Transition.leftToRightWithFade,
    ),
    // Sign - Up - View - Widget
    GetPage(
      name: SIGNUP_ROUTE,
      page: () => const SignupView(),
      transition: Transition.leftToRightWithFade,
    ),
    // Forgot - Password - View - Widget
    GetPage(
      name: FORGOT_PASSWORD_ROUTE,
      page: () => const ForgotView(),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
