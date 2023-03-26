import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/controller/home_controller.dart';
import 'package:open_close_loop_recycling/app/modules/notification/notification.dart';


import '../../../model/notification_model.dart';
import '../../../utils/colors.dart';

AppBar appbar(final controller) {
  return AppBar(
    elevation: 0,
    backgroundColor: AppColors.PRIMARY_COLOR,
    actions: [
     StreamBuilder<List<NotificationModel>>(
          stream: controller.getUnreadNotifications().asStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color: Colors.white,
                ),
              );
            }

            List<NotificationModel> notifications = snapshot.data!;
            return IconButton(
              icon: Stack(clipBehavior: Clip.none,
                children: [
                  const Icon(Icons.notifications_active_outlined),
                  if (notifications.isNotEmpty)
                    Positioned(
                      top: -6.h,
                      right: -4.w,
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: const BoxDecoration(
                          color: Colors.red,shape: BoxShape.circle,
                       
                        ),
                        child: Text(
                          notifications.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onPressed: () {
                //  await controller.markNotificationAsRead(FirebaseAuth.instance.currentUser!.uid);
                Get.to(NotificationView());
              },
            );
          },
        ),
    ],
  );
}
