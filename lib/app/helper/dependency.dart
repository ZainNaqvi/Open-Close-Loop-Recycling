import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/controller/forgot_password_controller.dart';
import 'package:open_close_loop_recycling/app/controller/home_controller.dart';
import 'package:open_close_loop_recycling/app/controller/request_controller.dart';
import '../controller/signin_controller.dart';
import '../controller/signup_controller.dart';
import '../controller/splash_controller.dart';

Future<void> init() async {
  // Home - View - Controller
  Get.lazyPut(() => HomeController(), fenix: true);
  // Splash - View - Controller
  Get.lazyPut(() => SplashController(), fenix: true);
  // Sign - Up - View - Controller
  Get.lazyPut(() => SignupController(), fenix: true);
  // Sign - In - View - Controller
  Get.lazyPut(() => SignInController(), fenix: true);
  // Forgot - Password - View - Controller
  Get.lazyPut(() => ForgotPasswordController(), fenix: true);
  // Request - Recycling - View - Controller
  Get.lazyPut(() => RequestController(), fenix: true);
}
