import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/colors.dart';

Row DontHaveAccount() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Don’t have an account?  ",
        style: TextStyle(
          color: AppColors.WHITE_COLOR,
        ),
      ),
      GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.SIGNUP_ROUTE);
        },
        child: Text(
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
