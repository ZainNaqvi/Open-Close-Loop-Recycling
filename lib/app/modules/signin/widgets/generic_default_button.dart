import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';

// ignore: non_constant_identifier_names
Widget GenericButton({
  required String text,
  required VoidCallback onPressed,
  Color? color,
  bool border = false,
  bool borderRadius = false,
  bool isBackground = false,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: Get.width,
      height: 48.h,
      decoration: BoxDecoration(
        color: isBackground ? AppColors.PRIMARY_COLOR : Colors.white,
        borderRadius: borderRadius
            ? BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              )
            : BorderRadius.circular(8.r),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isBackground ? Colors.white : AppColors.PRIMARY_COLOR,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
