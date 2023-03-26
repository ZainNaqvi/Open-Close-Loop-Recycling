import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    String userRole = userSnapshot.get('role');
    await Future.delayed(const Duration(seconds: 1));
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      final FirebaseAuth auth = FirebaseAuth.instance;

      if (auth.currentUser == null) {
        Get.offAllNamed(AppRoutes.ONBOARDING_ROUTE);
      } else if (auth.currentUser!.emailVerified &&
          auth.currentUser != null &&
          userRole == 'user') {
        Get.offAllNamed(AppRoutes.HOME_ROUTE);
      } else if (auth.currentUser!.emailVerified &&
          auth.currentUser != null &&
          userRole == 'admin') {
        Get.offAllNamed(AppRoutes.ADMIN_DASHBOARD_ROUTE);
      } else {
        Get.offAllNamed(AppRoutes.ONBOARDING_ROUTE);
      }
    } else {
      GenericSnackBar(text: "No internet connection found");
      GenericSnackBar(text: "Plese try again later...");
    }
  }
}
