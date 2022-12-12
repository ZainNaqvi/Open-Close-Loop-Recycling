import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/routes/routes.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';

Row Already_Have_Account() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Already have a account?  ",
        style: TextStyle(color: AppColors.WHITE_COLOR),
      ),
      GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.SIGN_IN_ROUTE);
        },
        child: Text(
          "Login Now",
          style: TextStyle(
            color: AppColors.WHITE_COLOR,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
