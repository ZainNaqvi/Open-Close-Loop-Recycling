import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/modules/splash/controllers/splash_controller.dart';

Future<void> init() async {
  Get.lazyPut(() => SplashController(), fenix: true);
}
