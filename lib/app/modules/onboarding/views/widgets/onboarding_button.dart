import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/routes.dart';

import '../../../../widgets/generic_button.dart';

class OnboardingButtons extends StatelessWidget {
  const OnboardingButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GenericButton(
          width: 294.w,
          text: "Get Started",
          onTap: () {
            Get.toNamed(AppRoutes.SIGNUP_ROUTE);
          },
        ),
        GenericButton(
          margin: 20.h,
          width: 294.w,
          isBackground: false,
          text: "Login",
          onTap: () {},
        ),
      ],
    );
  }
}
