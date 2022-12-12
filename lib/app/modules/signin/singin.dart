import 'package:flutter/material.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';

import 'widgets/body.dart';

class SigninView extends StatelessWidget {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: const Body(),
    );
  }
}
