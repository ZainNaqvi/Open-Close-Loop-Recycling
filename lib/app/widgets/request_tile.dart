import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';
import '../utils/file_path.dart';

class RequstTIle extends StatelessWidget {
  final data;
  VoidCallback? onTap;
  RequstTIle({
    Key? key,
    required this.data,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
            color: AppColors.PRIMARY_BACK_COLOR.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12.r)),
        width: double.maxFinite,
        padding: EdgeInsets.all(6.r),
        child: Row(children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 18.r,
                backgroundImage: AssetImage(FilePath.PROFILE_HOMESTYLE_IMAGE),
              ),
              SizedBox(
                width: 12.w,
              ),
              SizedBox(
                width: 218.w,
                child: Text(
                  data['message'],
                  maxLines: 1,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.keyboard_arrow_right_outlined,
                color: AppColors.PRIMARY_COLOR,
              )),
          SizedBox(
            width: 8.w,
          ),
        ]),
      ),
    );
  }
}
