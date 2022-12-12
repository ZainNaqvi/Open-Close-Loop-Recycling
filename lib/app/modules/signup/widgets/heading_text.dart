import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors.dart';
import '../../../utils/file_path.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    Key? key,
    required this.subTitle,
    required this.title,
  }) : super(key: key);
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
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
            padding: EdgeInsets.all(24.r),
            height: 137.h,
            width: 170.w,
            decoration: BoxDecoration(
                color: AppColors.PRIMARY_BACK_COLOR,
                borderRadius: BorderRadius.circular(24.r)),
            child: Image.asset(FilePath.WASTE_IMAGE),
          ),
          SizedBox(height: 24.0.h),
          Text(
            title,
            style: TextStyle(
              color: AppColors.WHITE_COLOR,
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 11.0.h),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.WHITE_COLOR,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 31.0.h),
        ],
      ),
    );
  }
}
