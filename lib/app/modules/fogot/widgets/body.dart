import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_close_loop_recycling/app/modules/fogot/widgets/form.dart';
import 'package:open_close_loop_recycling/app/modules/signup/widgets/heading_text.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 124.h),
            // Signin - to - your - account - container
            const HeadingText(
              subTitle:
                  'Provide your email and we will send you a link to reset your password',
              title: 'Forgot Password!',
            ),
            // Signin - Form - Widget
            SizedBox(height: 24.h),
            const ForgotFormWidget(),
          ],
        ),
      ),
    );
  }
}
