import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/controller/forgot_password_controller.dart';
import 'package:open_close_loop_recycling/app/controller/request_controller.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';

import '../../../utils/file_path.dart';
import '../../../widgets/generic_button.dart';
import '../../../widgets/generic_snake_bar.dart';
import '../../../widgets/generic_text_field.dart';

class ForgotFormWidget extends StatelessWidget {
  // Forgot - Password - Form - State
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ForgotFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(builder: (controller) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            Text("Form is pending "),
          ],
        ),
      );
    });
  }
}
