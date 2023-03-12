
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/services/auth/firebase_firestore.dart';

import '../routes/routes.dart';
import '../services/auth/firebase_auth.dart';
import '../widgets/generic_snake_bar.dart';

class SignInController extends GetxController {
  // Onloading -
  bool isloading = false;
  void updateIsLoading() {
    isloading = !isloading;
    update();
  }

  // Signin - Form - Text - Field - Controller
  // ************************************************
  // User - Email - Field
  final TextEditingController userEmailController = TextEditingController();
  // User - Password - Field
  final TextEditingController userPasswordController = TextEditingController();
// *************************************************
  // User - Password - Obscure
  bool _passwordIsObscure = true;
  // User - Password - Getter
  bool get passwordIsObscure => _passwordIsObscure;

  // Focus - Node
  final FocusNode _focusNode = FocusNode();
  FocusNode get focusNode => _focusNode;
  // Udating - Value - IsObscure

// ********************************************

  // update - Password - obscure
  void updatePasswordIsObscure() {
    _passwordIsObscure = !_passwordIsObscure;
    update();
  }
  // **********************************************
  // ********** Firebase - Crud - Operations *******************
  //***********************************************

  // Creating - The - Object - DbHelper

  final DbHelper _dbHelper = DbHelper();

  // Creating - New - User - Here

  Future<void> loginUser() async {
    updateIsLoading();
    String response = await _dbHelper.userLogin(
      email: userEmailController.text.trim(),
      password: userPasswordController.text.trim(),
    );
    // Checking - Response ->
    if (response == 'success') {
      GenericSnackBar(
          text:
              "Successfully loggedIn,\nWelcome to Waste - Management - App once's again!");

      userEmailController.clear();
      userPasswordController.clear();
      FirebaseFirestoreServices services = FirebaseFirestoreServices();
      final res = await services.getUserData();
      res == 'user'
          ? Get.offAllNamed(AppRoutes.HOME_ROUTE)
          : Get.offAllNamed(AppRoutes.ADMIN_DASHBOARD_ROUTE);
      updateIsLoading();
    } else {
      updateIsLoading();
    }
  }
}
