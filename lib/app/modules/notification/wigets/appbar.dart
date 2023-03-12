import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
