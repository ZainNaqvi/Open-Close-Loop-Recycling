import 'package:flutter/material.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';

import 'widgets/body.dart';

class ForgotView extends StatelessWidget {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: Body(),
    );
  }
}
