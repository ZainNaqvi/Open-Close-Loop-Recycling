import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/routes/routes.dart';
import '../../controller/home_controller.dart';
import '../../utils/colors.dart';
import '../../utils/file_path.dart';
import '../../widgets/generic_dialog_box.dart';
import '../../widgets/generic_snake_bar.dart';
import '../home/widgets/drawer_icon_list.dart';
import 'wigets/appbar.dart';
import 'wigets/body.dart';

class GuideLines extends StatelessWidget {
  const GuideLines({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        drawer: Drawer(child: GetBuilder<HomeController>(builder: (controller) {
          return Column(
            children: [
              SizedBox(height: 64.h),
              CircleAvatar(
                radius: 58.r,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  FilePath.PROFILE_HOMESTYLE_IMAGE,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                "Hello",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                "User Name",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 24.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Column(
                  children: List.generate(
                      DRAWER_ICON_LIST.length,
                      (index) => InkWell(
                            onTap: () {
                              controller.updateSelectedIndex(index);
                              switch (index) {
                                case 0:
                                  Get.offAllNamed(AppRoutes.HOME_ROUTE);
                                  break;
                                case 1:
                                  print("1");
                                  break;
                                case 2:
                                  print("2");
                                  break;
                                case 3:
                                  print("3");
                                  break;

                                default:
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 16.w,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: controller.selectedTabIndex != index
                                      ? Colors.transparent
                                      : AppColors.PRIMARY_COLOR
                                          .withOpacity(0.2)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 8.0.h, left: 24.w, bottom: 8.h),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      FilePath.DRAWER_PAYMENT_ICON,
                                    ),
                                    SizedBox(width: 18.w),
                                    Text(
                                      DRAWER_ICON_LIST[index]['text'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[900],
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
              ),
              SizedBox(height: 24.h),
              const Divider(),
              Padding(
                padding: EdgeInsets.only(top: 4.h),
                child: Column(
                  children: List.generate(
                      DRAWER_ICON_BOTTOM_LIST.length,
                      (index) => InkWell(
                            onTap: () {
                              controller.updateSelectedBottomIndex(index);
                              switch (index) {
                                case 0:
                                  GenericSnackBar(text: "Help & Support");
                                  break;
                                case 1:
                                  GenericDialog(
                                    context: context,
                                    pressed: () async {
                                      await logoutUser();
                                    },
                                    alertMessage:
                                        "Are you sure! You want to sign out?",
                                    buttonName: "LOGOUT",
                                  );
                                  break;
                                default:
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 16.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: Colors.transparent,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 16.0.h, left: 24.w, bottom: 8.h),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      DRAWER_ICON_BOTTOM_LIST[index]['icon'],
                                    ),
                                    SizedBox(width: 18.w),
                                    Text(
                                      DRAWER_ICON_BOTTOM_LIST[index]['text'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[900],
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
              ),
            ],
          );
        })),
        appBar: appbar(),
        body: const Body(),
      ),
    );
  } // Logging - OUt

  logoutUser() async {
    await Get.find<HomeController>().signOut();
    GenericSnackBar(text: "Successfully! logout ");
  }
}
