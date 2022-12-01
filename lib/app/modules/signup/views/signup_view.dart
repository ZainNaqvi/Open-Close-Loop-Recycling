import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';
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
          LoginToYourAccount(),
          // Text - form - fields
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                bottomLeft: Radius.circular(24.r),
                topRight: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
              color: AppColors.WHITE_COLOR,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28.r,
                  backgroundColor: Colors.teal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
