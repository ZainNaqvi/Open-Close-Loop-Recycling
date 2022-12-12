import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  // Forgot - Password - Form - State
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Getter ->
  GlobalKey<FormState> get formKey => _formKey;
  // Forgot - Password - Form - Text - Field - Controller
  // ************************************************
  // User - Email - Field
  final TextEditingController userEmailController = TextEditingController();
// *************************************************
}
