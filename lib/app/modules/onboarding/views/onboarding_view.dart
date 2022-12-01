import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';
import '../../../widgets/generic_button.dart';
import '../controllers/onboarding_controller.dart';
import 'widgets/welcome_box.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE_COLOR,
      body: Column(
        children: [
          // Background - Container - Box
          WelcomeBox(),
          // Get - Started - And - Login - Button
          GenericButton(
            width: 294.w,
            text: "Get Started",
            onTap: () {},
          ),
          GenericButton(
            margin: 20.h,
            width: 294.w,
            isBackground: false,
            text: "Get Started",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
