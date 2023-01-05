import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/colors.dart';

AppBar appbar() {
  return AppBar(
    backgroundColor: AppColors.PRIMARY_COLOR,
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.menu,
      ),
    ),
    elevation: 0,
    title: const Text(
      'Admin Home Page',
      style: TextStyle(color: Colors.white),
    ),
  );
}
