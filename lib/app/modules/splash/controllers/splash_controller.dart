import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    gotoPage();
  }

  gotoPage() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(AppRoutes.ON_BOARDINGVIEW_ROUTE);
  }
}
