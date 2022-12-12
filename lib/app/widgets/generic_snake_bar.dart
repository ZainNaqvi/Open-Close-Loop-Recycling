import 'package:get/get.dart';

import '../utils/colors.dart';

SnackbarController GenericSnackBar({required String text}) {
  return Get.snackbar(
    "Message",
    text,
    colorText: AppColors.WHITE_COLOR,
  );
}
