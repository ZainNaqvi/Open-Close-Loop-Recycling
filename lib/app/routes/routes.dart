import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/modules/admin/dashboard/dashboard.dart';
import 'package:open_close_loop_recycling/app/modules/guidelines/guidelines.dart';
import 'package:open_close_loop_recycling/app/modules/notification/notification.dart';
import 'package:open_close_loop_recycling/app/modules/request/request.dart';
import 'package:open_close_loop_recycling/app/modules/signin/singin.dart';
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
  static const SIGN_IN_ROUTE = '/signin';
  static const NOTIFICATION_ROUTE = '/notification';
  static const REQUEST_ROUTE = '/request';
  static const GUIDELINES = '/guidelines';
  static const ADMIN_DASHBOARD_ROUTE = '/dashboard';
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
    // Signin - View - Widget
    GetPage(
      name: SIGN_IN_ROUTE,
      page: () => const SigninView(),
      transition: Transition.leftToRightWithFade,
    ),
    // Notification - View - Widget
    GetPage(
      name: NOTIFICATION_ROUTE,
      page: () => const NotificationView(),
      transition: Transition.leftToRightWithFade,
    ),
    // Request - View - Widget
    GetPage(
      name: REQUEST_ROUTE,
      page: () => const RequestView(),
      transition: Transition.leftToRightWithFade,
    ),
    // GuideLines - View - Widget
    GetPage(
      name: GUIDELINES,
      page: () => const GuideLines(),
      transition: Transition.leftToRightWithFade,
    ),
    // Dash BOard - View - Widget
    GetPage(
      name: ADMIN_DASHBOARD_ROUTE,
      page: () => const DashBoardView(),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
