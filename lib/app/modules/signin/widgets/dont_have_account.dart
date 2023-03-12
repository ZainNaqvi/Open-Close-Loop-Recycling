import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/colors.dart';

// ignore: non_constant_identifier_names
Row DontHaveAccount() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Don’t have an account?  ",
        style: TextStyle(
          color: AppColors.WHITE_COLOR,
        ),
      ),
      GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.SIGNUP_ROUTE);
        },
        child: const Text(
          "Sign Up Now",
          style: TextStyle(
            color: AppColors.WHITE_COLOR,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
