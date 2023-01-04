import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';

AppBar appbar() {
  return AppBar(
    backgroundColor: AppColors.PRIMARY_COLOR,
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    ),
    elevation: 0,
    title: const Text(
      'Request',
      style: TextStyle(color: Colors.white),
    ),
  );
}
