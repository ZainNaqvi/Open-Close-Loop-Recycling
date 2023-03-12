import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/tile.dart';

class Body extends StatelessWidget {
  final data;
  const Body({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text(
            "Request Details",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 32.h),
          Tile(title: 'Name', value: data['name'] ?? 'no-name'),
          SizedBox(height: 16.h),
          Tile(title: 'Address', value: data['address']),
          SizedBox(height: 16.h),
          Tile(title: 'Type', value: data['trash_type']),
          SizedBox(height: 16.h),
          Tile(title: 'Dumper', value: data['dumper_size']),
          SizedBox(height: 16.h),
          Tile(title: 'Date', value: data['date']),
          SizedBox(height: 16.h),
          Tile(title: 'Time', value: data['time']),
          const Spacer(),
        data['approved']?const SizedBox():  const Center(
              child: Text(
            'Please wait for approval from the administrator.',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          )),
          SizedBox(
            height: 8.h,
          )
        ],
      ),
    );
  }
}
