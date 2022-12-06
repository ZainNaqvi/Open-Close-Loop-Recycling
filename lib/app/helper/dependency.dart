import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/modules/login/controllers/controller.dart';
import 'package:open_close_loop_recycling/app/modules/signup/controllers/signup_controller.dart';
import 'package:open_close_loop_recycling/app/modules/splash/controllers/splash_controller.dart';

Future<void> init() async {
  Get.lazyPut(() => SplashController(), fenix: true);
  Get.lazyPut(() => SignupController(), fenix: true);
  Get.lazyPut(() => LoginController(), fenix: true);
}
