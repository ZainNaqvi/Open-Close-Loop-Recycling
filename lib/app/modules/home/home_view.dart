import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/controller/home_controller.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: AppColors.PRIMARY_COLOR,
        title: Text(
          'Home View',
          style: TextStyle(color: AppColors.WHITE_COLOR),
        ),
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return Center(
          child: controller.isloading
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.WHITE_COLOR,
                ))
              : OutlinedButton(
                  onPressed: () async {
                    await controller.signOut();
                  },
                  child: Text(
                    'Logout here...',
                  ),
                ),
        );
      }),
    );
  }
}
