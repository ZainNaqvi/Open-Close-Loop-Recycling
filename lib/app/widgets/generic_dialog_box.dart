import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'generic_button.dart';
// ignore: non_constant_identifier_names
GenericDialog({
  required BuildContext context,
  required VoidCallback pressed,
  required String alertMessage,
  required String buttonName,
}) =>
    showDialog(
      context: context,
      builder: (BuildContext context) => GenericDialogBox(
        alertMessage: alertMessage,
        buttonName: buttonName,
        pressed: pressed,
      ),
    );
// ignore: non_constant_identifier_names
GenericDialogBox({
  required VoidCallback pressed,
  required String alertMessage,
  required String buttonName,
}) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0.r),
    ), //this right here
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      height: 154.0.h,
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(15.0.r),
            child: Text(
              alertMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 4.0.h,
            ),
            child: SizedBox(
              height: 54.h,
              width: 114.w,
              child: GenericButton(
                width: 114.w,
                onTap: pressed,
                text: buttonName,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
