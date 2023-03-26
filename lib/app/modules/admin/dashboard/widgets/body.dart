import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/modules/request_detail/request_detail.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/file_path.dart';
import '../../../../widgets/request_tile.dart';
import '../../all_requests.dart/all_request.dart';
import '../../guideLines_videos/guideLines.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeBox(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dashboard",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.to(TotalRequest());
                        },
                        child: dashBoardTiles(
                            FilePath.APPLICATION_ICON, 'Requests')),
                    GestureDetector(
                        onTap: () {
                          Get.to(const AdminGuideLinesView());
                        },
                        child: dashBoardTiles(
                            FilePath.REVIEWS_ICON, 'Guidelines')),
                  ],
                ),
                SizedBox(height: 30.h),
                Text(
                  "Recent Requests",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('waste_request')
                        .orderBy('date', descending: true)
                        .limit(4)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        );
                      }
                      return snapshot.data!.docs.isEmpty
                          ? const Center(
                              child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text("There is no data to display."),
                            ))
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) => RequstTIle(
                                t: true,
                                data: snapshot.data!.docs[index].data(),
                                onTap: () {
                                      Get.to(RequestDetail(
                                        data: snapshot.data!.docs[index].data(),
                                        t: true,
                                      ));
                                    },
                              ));
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container dashBoardTiles(String path, String title) {
    return Container(
      height: 85.h,
      width: 154.w,
      decoration: BoxDecoration(
        color: AppColors.PRIMARY_BACK_COLOR,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Stack(
          alignment: Alignment(0, -2),
          clipBehavior: Clip.none,
          children: [
            Image.asset(path),
            Positioned(
              top: 42,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }

  Container WelcomeBox() {
    return Container(
      margin: EdgeInsets.only(bottom: 30.h),
      width: double.maxFinite,
      height: 274.h,
      decoration: BoxDecoration(
        color: AppColors.PRIMARY_COLOR,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 22.h),
          // Waste - App - Logo
          SizedBox(
            width: 104.w,
            child: Image.asset(FilePath.WASTE_IMAGE),
          ),
          SizedBox(height: 28.0.h),
          // Welcome - Text
          Text(
            "Welcome to",
            style: TextStyle(
              color: AppColors.WHITE_COLOR,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 11.0.h),
          // Sub - Heading - Waste - Management
          Text(
            "Open Close Loop Recycling",
            style: TextStyle(
              color: AppColors.WHITE_COLOR,
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
