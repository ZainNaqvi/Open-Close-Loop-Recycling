import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/services/auth/firebase_firestore.dart';

import '../routes/routes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../widgets/generic_snake_bar.dart';

class SplashController extends GetxController {
  // Called -> immediately - after - the - widget - is - allocated - in - memory.
  @override
  void onInit() {
    super.onInit();
    // Navigator - Function*
    gotoToNextPage();
  }

  gotoToNextPage() async {


    await Future.delayed(const Duration(seconds: 1));
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      final FirebaseAuth auth = FirebaseAuth.instance;

      if (auth.currentUser == null) {
        Get.offAllNamed(AppRoutes.ONBOARDING_ROUTE);
      } else if (auth.currentUser!.emailVerified &&
          auth.currentUser != null 
         ) {
        FirebaseFirestoreServices services = FirebaseFirestoreServices();
        final res = await services.getUserData();
        res == 'user'
            ? Get.offAllNamed(AppRoutes.HOME_ROUTE)
            : Get.offAllNamed(AppRoutes.ADMIN_DASHBOARD_ROUTE);
      } else {
        Get.offAllNamed(AppRoutes.ONBOARDING_ROUTE);
      }
    } else {
      GenericSnackBar(text: "No internet connection found");
      GenericSnackBar(text: "Plese try again later...");
    }
  }
}
