import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tile extends StatelessWidget {
  final String title;
  final String value;
  const Tile({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 74.w,
              child: Text(
                title,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            SizedBox(
              width: 244.w,
              child: Text(
                value,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 6.h,
        ),
        const Divider(),
      ],
    );
  }
}
