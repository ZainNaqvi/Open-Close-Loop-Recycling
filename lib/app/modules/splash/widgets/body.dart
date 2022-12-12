import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/splash_controller.dart';
import '../../../utils/file_path.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (controller) {
      return Center(
        child: Image.asset(FilePath.WASTE_IMAGE),
      );
    });
  }
}
