import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/utils/file_path.dart';

import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(builder: (controller) {
        return Center(
          child: Image.asset(FilePath.WASTE_IMAGE),
        );
      }),
    );
  }
}
