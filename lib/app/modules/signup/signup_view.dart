import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';
import '../../routes/routes.dart';
import 'widgets/body.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(AppRoutes.ONBOARDING_ROUTE);
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.PRIMARY_COLOR,
        body: const Body(),
      ),
    );
  }
}
