import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/modules/request/request.dart';
import 'package:open_close_loop_recycling/app/routes/routes.dart';
import 'package:open_close_loop_recycling/app/utils/file_path.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/colors.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.isloading
          ? Center(
              child: CircularProgressIndicator(
              color: AppColors.WHITE_COLOR,
            ))
          : SizedBox(
              height: double.maxFinite,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Map - widget - wil - be - here...
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.r),
                    width: double.maxFinite,
                    height: 124.h,
                    decoration: BoxDecoration(
                      color: AppColors.PRIMARY_COLOR,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18.r),
                        bottomRight: Radius.circular(18.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 42.r,
                              backgroundImage:
                                  AssetImage(FilePath.PROFILE_HOMESTYLE_IMAGE),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome",
                                  style: TextStyle(
                                    color: AppColors.WHITE_COLOR,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  "User Name",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: AppColors.WHITE_COLOR,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 18.h,
                    left: 28.w,
                    child: Column(
                      children: [
                        MapButton(iconData: Icons.add, onPressed: () {}),
                        SizedBox(height: 12.h),
                        MapButton(iconData: Icons.remove, onPressed: () {}),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 18.h,
                    right: 28.w,
                    child: Column(
                      children: [
                        MapButton(
                            iconData: Icons.location_searching_rounded,
                            onPressed: () {}),
                        SizedBox(height: 12.h),
                        MapButton(
                            iconData: Icons.menu_open,
                            onPressed: () {
                              Get.toNamed(AppRoutes.REQUEST_ROUTE);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            );
    });
  }

  Container MapButton(
      {required VoidCallback onPressed, required IconData iconData}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.PRIMARY_COLOR,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: AppColors.WHITE_COLOR,
        ),
      ),
    );
  }
}
