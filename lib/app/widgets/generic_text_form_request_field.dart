import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: non_constant_identifier_names
Container GenericRequestFormFIeld({String? Function(String?)? validator,
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
       maxLines==1?SizedBox(height: 8.h): SizedBox(height: 0.h),
        TextFormField(
          maxLines: maxLines,
          readOnly: readOnly,
          controller: controller,
          validator: validator ,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: TextInputAction.next,
          style: TextStyle(height: 1.3.r),
          decoration: InputDecoration(
            
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon),
                    onPressed: onPressed,
                  )
                : const SizedBox(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            hintText: hintText,
            enabledBorder: outlinedInputBorder(),
            border: outlinedInputBorder(),
            focusedBorder: outlinedInputBorder(),
          ),
        ),
      ],
    ),
  );
}

OutlineInputBorder outlinedInputBorder() {
  return const OutlineInputBorder(borderSide: BorderSide(color: Colors.black));
}
