import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/controller/signin_controller.dart';
import 'package:open_close_loop_recycling/app/routes/routes.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';

import '../../../utils/file_path.dart';
import '../../../widgets/generic_button.dart';
import '../../../widgets/generic_snake_bar.dart';
import '../../../widgets/generic_text_field.dart';
import 'dont_have_account.dart';

class SigninFormWidget extends StatelessWidget {
  // Signin - Form - State
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SigninFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (controller) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            GenericTextField(
              focusNode: controller.focusNode,
              onEditingComplete: () => controller.focusNode.nextFocus(),
              hintText: "User Email",
              prefixIcon: FilePath.EMAIL_ICON,
              controller: controller.userEmailController,
            ),
            SizedBox(height: 24.h),
            GenericTextField(
              onEditingComplete: () => controller.focusNode.nextFocus(),
              hintText: "User Password",
              isSuffixIcon: true,
              obscureText: controller.passwordIsObscure,
              onPressed: () {
                controller.updatePasswordIsObscure();
              },
              suffixIcon: controller.passwordIsObscure
                  ? Icons.visibility
                  : Icons.visibility_off,
              prefixIcon: FilePath.LOCK_ICON,
              controller: controller.userPasswordController,
              textInputAction: TextInputAction.done,
            ),
            SizedBox(height: 2.h),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.FORGOT_PASSWORD_ROUTE);
                },
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: AppColors.WHITE_COLOR,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 44.h),
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
                          await controller.loginUser();
                  } else {
                    GenericSnackBar(text: "Email is not valid");
                  }
                      } else {
                        GenericSnackBar(text: "All fields required");
                }
              },
              text: "Sign in",
              isBackground: true,
            ),
            SizedBox(height: 22.h),
            DontHaveAccount(),
            SizedBox(height: 22.h),
          ],
        ),
      );
    });
  }
}
