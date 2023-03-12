import 'package:flutter/material.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';
import 'widgets/body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.WHITE_COLOR,
      body: Body(),
    );
  }
}

