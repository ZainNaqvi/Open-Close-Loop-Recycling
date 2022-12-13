import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/controller/signup_controller.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';
import 'package:open_close_loop_recycling/app/utils/file_path.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_snake_bar.dart';

import '../../../widgets/generic_button.dart';
import '../../../widgets/generic_text_field.dart';
import 'already_have_account.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(builder: (controller) {
      return Form(
        key: controller.formKey,
        child: Column(
          children: [
            // User - Name - Field
            GenericTextField(
              focusNode: controller.focusNode,
              onEditingComplete: () => controller.focusNode.nextFocus(),
              hintText: "User Name",
              prefixIcon: FilePath.PERSON_ICON,
              controller: controller.userNameController,
            ),

            // User - Email - Field
            SizedBox(height: 24.h),
            GenericTextField(
              hintText: "User Email",
              onEditingComplete: () => controller.focusNode.nextFocus(),
              prefixIcon: FilePath.EMAIL_ICON,
              controller: controller.userEmailController,
            ),
            SizedBox(height: 24.h),
            // User - Password - Field
            GenericTextField(
              hintText: "User Password",
              onEditingComplete: () => controller.focusNode.nextFocus(),
              controller: controller.userPasswordController,
              prefixIcon: FilePath.LOCK_ICON,
              isSuffixIcon: true,
              onPressed: () {
                controller.updatePasswordIsObscure();
              },
              suffixIcon: controller.passwordIsObscure
                  ? Icons.visibility
                  : Icons.visibility_off,
              obscureText: controller.passwordIsObscure,
            ),
            SizedBox(height: 24.h),
            // User - Confirm - Password - Field
            GenericTextField(
              hintText: "Confirm Password",
              onEditingComplete: () => controller.focusNode.nextFocus(),
              prefixIcon: FilePath.LOCK_ICON,
              controller: controller.userConfirmPasswordController,
              onPressed: () {
                controller.updateConfirmPasswordIsObscure();
              },
              suffixIcon: controller.confirmPasswordIsObscure
                  ? Icons.visibility
                  : Icons.visibility_off,
              textInputAction: TextInputAction.done,
              obscureText: controller.confirmPasswordIsObscure,
              isSuffixIcon: true,
            ),

            SizedBox(height: 24.h),

            // Signup - Form - Generic - Button
            controller.isloading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.WHITE_COLOR,
                      semanticsLabel: "Proccessing...",
                    ),
                  )
                : GenericButton(
                    onTap: () async {
                      if (controller.formKey.currentState!.validate()) {
                        if (controller.userPasswordController.text ==
                            controller.userConfirmPasswordController.text) {
                          await controller.createUser();
                        } else {
                          GenericSnackBar(text: "Password does not matched");
                        }
                      } else {
                        GenericSnackBar(text: "All fields required");
                      }
                    },
                    text: "Sign up",
                    isBackground: true,
                  ),
            SizedBox(height: 14.h),
            // Already - Have - Account
            Already_Have_Account(),
          ],
        ),
      );
    });
  }
}
