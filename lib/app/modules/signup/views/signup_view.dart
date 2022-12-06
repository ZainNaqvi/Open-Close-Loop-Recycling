import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_button.dart';
import '../../../widgets/generic_text_field.dart';
import '../controllers/signup_controller.dart';
import 'widgets/login_to_your_account.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Login - to - your - account - container
          const LoginToYourAccount(),
          // Text - form - fields
          Form(
            child: Column(
              children: [
                GenericTextField(),
                SizedBox(height: 10.h),
                GenericTextField(),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password",
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                GenericButton(onTap: () {}, text: "Login"),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      "Don’t have an account?  ",
                      style: TextStyle(),
                    ),
                    Text("Sign Up Now"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
