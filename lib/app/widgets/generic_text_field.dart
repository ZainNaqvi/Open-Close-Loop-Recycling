import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:open_close_loop_recycling/app/utils/colors.dart';

class GenericTextField extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  String? Function(String?)? validator;
  void Function()? onEditingComplete;
  bool obscureText;
  TextInputType keyboardType;
  bool readOnly;
  TextInputAction textInputAction;
  bool isSuffixIcon;
  VoidCallback? onPressed;
  IconData? suffixIcon;
  final String prefixIcon;
  FocusNode? focusNode;
  bool autofocus;
  void Function(String)? onChanged;
  GenericTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.onChanged,
    this.autofocus = false,
    this.controller,
    this.isSuffixIcon = false,
    this.validator,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onEditingComplete,
    this.onPressed,
    this.readOnly = false,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.GREY_COLOR),
            borderRadius: BorderRadius.circular(30.r),
            color: AppColors.PRIMARY_BACK_COLOR,
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 26.r,
                backgroundColor: Colors.white,
                child: Center(
                  child: SvgPicture.asset(prefixIcon),
                ),
              ),
              Expanded(
                  child: TextFormField(
                onChanged: onChanged,
                textAlign: TextAlign.start,
                onEditingComplete: onEditingComplete,
                focusNode: focusNode,
                autofocus: autofocus,
                readOnly: readOnly,
                keyboardType: keyboardType,
                obscureText: obscureText,
                textInputAction: textInputAction,
                controller: controller,
                validator: validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                  height: 1.6.r,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(bottom: 0.0, top: 15.0.r, left: 8.w),
                  errorMaxLines: 2,
                  isDense: true,
                  errorStyle: TextStyle(
                    color: Colors.red,
                    height: 0,
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.white),
                  enabledBorder: outlineBorder(),
                  focusedBorder: outlineBorder(),
                  border: outlineBorder(),
                ),
              )),
              isSuffixIcon
                  ? IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        suffixIcon,
                        color: AppColors.WHITE_COLOR,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder outlineBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(color: Colors.transparent),
  );
}
