import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenericLoader extends GetxController {
  genericLoader(bool value) {
    if (value) {
      onLoading(value);
    } else {
      Navigator.pop(Get.context!);
    }
    update();
  }

  onLoading(bool value) {
    showDialog(
      context: Get.context!,
      barrierDismissible: value,
      builder: (context) => const Center(
          child: CircularProgressIndicator(
        strokeWidth: 2,
        // Color of Loader this is Primary Color Most Cases
      )),
    );
  }
}
