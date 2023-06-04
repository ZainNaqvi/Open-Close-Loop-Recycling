import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/routes/routes.dart';
import 'package:open_close_loop_recycling/app/utils/file_path.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/colors.dart';
import '../../../widgets/generic_map_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.currentPosition == null || controller.isloading
          ? const Center(
              child: CircularProgressIndicator(
              color: AppColors.WHITE_COLOR,
            ))
          : SizedBox(
              height: double.maxFinite,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  MapScreen(
                    latititue: controller.currentPosition!.latitude.toString(),
                    lan: controller.currentPosition!.longitude.toString(),
                  ),
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
                                const Text(
                                  "Welcome",
                                  style: TextStyle(
                                    color: AppColors.WHITE_COLOR,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                controller.userCreditialsData[0].name == null
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2),
                                      )
                                    : Text(
                                        controller.userCreditialsData[0].name,
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
                  // controller.currentPosition == null
                  //     ? const Center(
                  //         child: CircularProgressIndicator(strokeWidth: 2),
                  //       )
                  //     : Positioned(
                  //         bottom: 18.h,
                  //         left: 28.w,
                  //         child: Column(
                  //           children: [
                  //             MapButton(iconData: Icons.add, onPressed: () {}),
                  //             SizedBox(height: 12.h),
                  //             MapButton(
                  //                 iconData: Icons.remove, onPressed: () {}),
                  //           ],
                  //         ),
                  //       ),

                  Positioned(
                    bottom: 18.h,
                    left: 28.w,
                    child: Column(
                      children: [
                        MapButton(
                            iconData: Icons.location_searching_rounded,
                            onPressed: () {
                              controller.getCurrentPosition();
                            }),
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

  // ignore: non_constant_identifier_names
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
