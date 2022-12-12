import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';

import '../../signin/singin.dart';

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
          Get.to(const SigninView());
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
