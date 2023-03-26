import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/modules/request_detail/request_detail.dart';
import 'package:open_close_loop_recycling/app/utils/file_path.dart';

import '../../../controller/home_controller.dart';
import '../../../model/notification_model.dart';

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
            GetBuilder<HomeController>(builder: (controller) {
              return StreamBuilder<List<NotificationModel>>(
                stream: controller.getAllNotification().asStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  }

                  List<NotificationModel> notifications = snapshot.data!;

                  return Column(
                    children: List.generate(
                      notifications.length,
                      (index) => ColoredBox(
                        color: notifications[index].read!
                            ? Colors.transparent
                            : Colors.blue[50]!,
                        child: ListTile(
                          onTap: () async {
                            print(notifications[index].notificationId);
                            DocumentReference documentRef = FirebaseFirestore
                                .instance
                                .collection('waste_request')
                                .doc(notifications[index].requestId);

                            DocumentSnapshot documentSnapshot =
                                await documentRef.get();

                            if (documentSnapshot.exists) {
                              // Access the document data using the data property
                              Object? data = documentSnapshot.data();
                              Get.to(RequestDetail(data: data));
                            } else {
                              print('Document does not exist');
                            }
                            controller.markNotificationAsRead(
                                notifications[index].notificationId!);
                          },
                          title: Text(notifications[index].message.toString()),
                          leading: SvgPicture.asset(
                            FilePath.NOTIFICATION_ICON,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
