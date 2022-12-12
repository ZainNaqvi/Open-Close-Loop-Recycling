import 'package:flutter/material.dart';
import 'package:open_close_loop_recycling/app/modules/splash/widgets/body.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: const Body(),
    );
  }
}
