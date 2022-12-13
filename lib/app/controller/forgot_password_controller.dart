import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';

import '../routes/routes.dart';
import '../services/auth/firebase_auth.dart';
import '../widgets/generic_snake_bar.dart';

class ForgotPasswordController extends GetxController {
  // Onloading -
  bool isloading = false;
  void updateIsLoading() {
    isloading = !isloading;
    update();
  }

  // Forgot - Password - Form - Text - Field - Controller
  // ************************************************
  // User - Email - Field
  final TextEditingController userEmailController = TextEditingController();
  // **********************************************
  // ********** Firebase - Crud - Operations *******************
  //***********************************************

  // Creating - The - Object - DbHelper

  DbHelper _dbHelper = DbHelper();

  // Creating - New - User - Here

  Future<void> forgotPassword() async {
    updateIsLoading();
    String response = await _dbHelper.forgotPassword(
      email: userEmailController.text.trim(),
    );
    // Checking - Response ->
    if (response == 'success') {
      GenericSnackBar(
          text: "Password reset email sended to your account successfully!");
      Get.toNamed(AppRoutes.SIGN_IN_ROUTE);
      // await FlutterWebBrowser.openWebPage(
      //   url: "https://mail.google.com/",
      //   customTabsOptions: CustomTabsOptions(
      //     toolbarColor: AppColors.PRIMARY_COLOR,
      //     navigationBarColor: AppColors.PRIMARY_COLOR,
      //   ),
      // );
      updateIsLoading();
    } else {
      updateIsLoading();
    }
  }
}
