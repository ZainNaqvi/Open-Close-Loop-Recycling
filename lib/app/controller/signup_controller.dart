import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // Signup - Form - State
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Getter ->
  GlobalKey<FormState> get formKey => _formKey;
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
  bool _passwordIsObscure = false;
  // User - Password - Getter
  bool get passwordIsObscure => _passwordIsObscure;

  // User - Confirm - Password - Obscure
  bool _confirmPasswordIsObscure = false;
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
}
