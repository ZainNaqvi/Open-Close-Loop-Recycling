import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/file_path.dart';

class LoginToYourAccount extends StatelessWidget {
  const LoginToYourAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 354.h,
      decoration: BoxDecoration(
        color: AppColors.PRIMARY_COLOR,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 184.h,
            width: 234.w,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8.r)),
            child: Image.asset(FilePath.WASTE_IMAGE),
          ),
          SizedBox(height: 28.0.h),
          Text(
            "Welcome to",
            style: TextStyle(
              color: AppColors.WHITE_COLOR,
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 11.0.h),
          Text(
            "Login to your account",
            style: TextStyle(
              color: AppColors.WHITE_COLOR,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
