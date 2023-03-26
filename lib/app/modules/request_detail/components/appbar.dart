import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/routes/routes.dart';
import 'package:open_close_loop_recycling/app/utils/file_path.dart';

import '../../../utils/colors.dart';

AppBar appbar() {
  return AppBar(
    title: const Text('Requests'),
    centerTitle: true,
    elevation: 0,
    backgroundColor: AppColors.PRIMARY_COLOR,
    
  );
}
