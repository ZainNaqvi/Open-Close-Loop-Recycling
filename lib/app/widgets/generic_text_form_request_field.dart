import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container GenericRequestFormFIeld({
  required String hintText,
  required String title,
  required final controller,
  IconData? suffixIcon,
  VoidCallback? onPressed,
  bool readOnly = false,
  int maxLines = 1,
  double height = 44,
}) {
  return Container(
    margin: EdgeInsets.only(top: 8.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: title == '' ? 0.h : 8.h),
          alignment: Alignment.center,
          height: height.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: Colors.black,
            ),
          ),
          child: TextFormField(
            maxLines: maxLines,
            readOnly: readOnly,
            controller: controller,
            textInputAction: TextInputAction.next,
            style: TextStyle(height: 1.3.r),
            decoration: InputDecoration(
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(suffixIcon),
                      onPressed: onPressed,
                    )
                  : SizedBox(),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              hintText: hintText,
              enabledBorder: outlinedInputBorder(),
              border: outlinedInputBorder(),
              focusedBorder: outlinedInputBorder(),
            ),
          ),
        ),
      ],
    ),
  );
}

OutlineInputBorder outlinedInputBorder() {
  return OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
}
