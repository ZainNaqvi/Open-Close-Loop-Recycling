import 'package:get/get.dart';

import '../routes/routes.dart';

class SplashController extends GetxController {
  // Called -> immediately - after - the - widget - is - allocated - in - memory.
  @override
  void onInit() {
    super.onInit();
    // Navigator - Function*
    gotoPage();
  }

  gotoPage() async {
    await Future.delayed(const Duration(seconds: 3));
    // Called - View - after - Some - Delay
    Get.offAllNamed(AppRoutes.ONBOARDING_ROUTE);
  }
}
