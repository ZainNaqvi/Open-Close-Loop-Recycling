import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'heading_text.dart';
import 'form.dart';

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
            SizedBox(height: 58.h),
            // Login - to - your - account - container
            const HeadingText(title: "Sign up", subTitle: "Create an account"),
            // Signup - Form - Widget
            SignupForm(),
          ],
        ),
      ),
    );
  }
}
