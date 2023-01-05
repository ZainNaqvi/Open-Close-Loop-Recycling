import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_close_loop_recycling/app/modules/fogot/widgets/form.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';
import 'package:open_close_loop_recycling/app/utils/file_path.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container -> Image
            Padding(
              padding: EdgeInsets.only(top: 24.h),
              child: Row(
                children: [
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: AppColors.PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Image.asset(FilePath.WASTE_IMAGE_REQUEST),
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Another Recycling',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          'Saddar, Pakistan',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Row(
                          children: [
                            companyStats(
                              title: '4.5',
                              description: "1052 Reviews",
                            ),
                            SizedBox(width: 2.w),
                            SizedBox(
                              height: 22.h,
                              child: VerticalDivider(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            companyStats(
                              title: '7am - 6pm',
                              description: "Mon - Sun",
                            ),
                            SizedBox(width: 2.w),
                            SizedBox(
                              height: 22.h,
                              child: VerticalDivider(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 2.w),
                            companyStats(
                              title: '\$49.25',
                              description: "Per Month",
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Text(
                "Trash Details",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            ForgotFormWidget(),
          ],
        ),
      ),
    );
  }

  Column companyStats({
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
