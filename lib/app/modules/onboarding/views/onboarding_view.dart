import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';
import '../controllers/onboarding_controller.dart';
import 'widgets/onboarding_button.dart';
import 'widgets/welcome_box.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE_COLOR,
      body: Column(
        children: const [
          // Background - Container - Box
          WelcomeBox(),
          // Get - Started - And - Login - Button
          OnboardingButtons(),
        ],
      ),
    );
  }
}
