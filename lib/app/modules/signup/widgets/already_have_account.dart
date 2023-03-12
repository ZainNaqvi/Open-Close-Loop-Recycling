import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/routes/routes.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';

// ignore: non_constant_identifier_names
Row Already_Have_Account() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Already have a account?  ",
        style: TextStyle(color: AppColors.WHITE_COLOR),
      ),
      GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.SIGN_IN_ROUTE);
        },
        child: const Text(
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
