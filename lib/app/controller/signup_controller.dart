import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/routes/routes.dart';
import 'package:open_close_loop_recycling/app/services/auth/firebase_auth.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_snake_bar.dart';

class SignupController extends GetxController {
  // Onloading -
  bool isloading = false;
  void updateIsLoading() {
    isloading = !isloading;
    update();
  }
  // Signup - Form - Text - Field - Controller
  // ************************************************
  // User - Name - Field
  final TextEditingController userNameController = TextEditingController();
  // User - Email - Field
  final TextEditingController userEmailController = TextEditingController();
  // User - Password - Field
  final TextEditingController userPasswordController = TextEditingController();
  // User - Confirm - Password - Field
  final TextEditingController userConfirmPasswordController =
      TextEditingController();
// *************************************************
  // User - Password - Obscure
  bool _passwordIsObscure = true;
  // User - Password - Getter
  bool get passwordIsObscure => _passwordIsObscure;

  // User - Confirm - Password - Obscure
  bool _confirmPasswordIsObscure = true;
  // User - Confirm - Password - Getter
  bool get confirmPasswordIsObscure => _confirmPasswordIsObscure;

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

  // update - Confirm - Password - obscure
  void updateConfirmPasswordIsObscure() {
    _confirmPasswordIsObscure = !_confirmPasswordIsObscure;
    update();
  }
  // **********************************************
  // ********** Firebase - Crud - Operations *******************
  //***********************************************

  // Creating - The - Object - DbHelper

  DbHelper _dbHelper = DbHelper();

  // Creating - New - User - Here

  Future<void> createUser() async {
    updateIsLoading();
    String response = await _dbHelper.createUser(
      name: userNameController.text,
      email: userEmailController.text.trim(),
      password: userPasswordController.text.trim(),
    );
    // Checking - Response ->
    if (response == 'success') {
      GenericSnackBar(text: "Successfully created your account");
      userNameController.clear();
      userEmailController.clear();
      userPasswordController.clear();
      userConfirmPasswordController.clear();
      Get.toNamed(AppRoutes.SIGN_IN_ROUTE);

      updateIsLoading();
    } else {
      updateIsLoading();
    }
  }
}
