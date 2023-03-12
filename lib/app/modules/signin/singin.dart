import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/routes/routes.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';

import 'widgets/body.dart';

class SigninView extends StatelessWidget {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(AppRoutes.ONBOARDING_ROUTE);
        return true;
      },
      child: const Scaffold(
        backgroundColor: AppColors.PRIMARY_COLOR,
        body: Body(),
      ),
    );
  }
}
