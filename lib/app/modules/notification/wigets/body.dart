import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Text(
                'Today',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
            ),
            SizedBox(height: 14.h),
            Column(
              children: List.generate(
                3,
                (index) => ListTile(
                    title: Text(
                        'Your request #675747 to another Recycling is approved'),
                    leading: Icon(
                      Icons.messenger_outline_rounded,
                      color: Colors.teal,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
