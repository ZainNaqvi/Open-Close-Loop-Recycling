import 'package:get/get.dart';

import '../utils/colors.dart';

// ignore: non_constant_identifier_names
SnackbarController GenericSnackBar({required String text}) {
  return Get.snackbar(
    "Message",
    text,
    colorText: AppColors.WHITE_COLOR,
  );
}
