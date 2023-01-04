import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/utils/file_path.dart';

import '../../../utils/colors.dart';

AppBar appbar() {
  return AppBar(
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: const Text(
      'Notification',
      style: TextStyle(color: Colors.black),
    ),
  );
}
