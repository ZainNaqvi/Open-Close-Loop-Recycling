import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/colors.dart';

// ignore: must_be_immutable
class GenericButton extends StatelessWidget {
  final String text;
  VoidCallback? onTap;
  bool? isBackground;
  final double width;
  final double margin;
  GenericButton({
    Key? key,
    this.isBackground,
    required this.onTap,
    this.margin = 0,
    this.width = double.maxFinite,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.only(top: margin),
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(24.r),
            onTap: onTap,
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: isBackground != null
                      ? AppColors.WHITE_COLOR
                      : AppColors.PRIMARY_COLOR,
                  border: Border.all(color: AppColors.PRIMARY_COLOR)),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(14.0.r),
                  child: Text(
                    text.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: isBackground != null
                          ? AppColors.PRIMARY_COLOR
                          : AppColors.WHITE_COLOR,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
