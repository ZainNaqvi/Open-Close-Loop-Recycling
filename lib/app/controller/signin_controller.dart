import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  // Signin - Form - State
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Getter ->
  GlobalKey<FormState> get formKey => _formKey;
  // Signin - Form - Text - Field - Controller
  // ************************************************
  // User - Email - Field
  final TextEditingController userEmailController = TextEditingController();
  // User - Password - Field
  final TextEditingController userPasswordController = TextEditingController();
// *************************************************
  // User - Password - Obscure
  bool _passwordIsObscure = false;
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
}
