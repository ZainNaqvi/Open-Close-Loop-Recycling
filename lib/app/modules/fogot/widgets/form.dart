
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/controller/forgot_password_controller.dart';
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
    return GetBuilder<ForgotPasswordController>(builder: (controller) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            GenericTextField(
              hintText: "User Email",
              prefixIcon: FilePath.EMAIL_ICON,
              controller: controller.userEmailController,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 34.h),
            controller.isloading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.WHITE_COLOR,
                      semanticsLabel: 'processing...',
                    ),
                  )
                : GenericButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        if (controller.userEmailController.text.isEmail) {
                          await controller.forgotPassword();
                        } else {
                          GenericSnackBar(text: "Email is not valid");
                        }
                      } else {
                        GenericSnackBar(text: "Email is required");
                      }
                    },
                    text: "Reset Password",
                    isBackground: true,
                  ),
            SizedBox(height: 24.h),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "Go Back",
                style: TextStyle(
                  color: AppColors.WHITE_COLOR,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
