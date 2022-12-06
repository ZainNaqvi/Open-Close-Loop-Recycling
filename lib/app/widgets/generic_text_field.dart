import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenericTextField extends StatelessWidget {
  const GenericTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          bottomLeft: Radius.circular(24.r),
          topRight: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
        ),
        color: Colors.blue.withOpacity(0.2),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: Colors.white,
            child: Center(
              child: Icon(
                Icons.person_outline,
              ),
            ),
          ),
          Expanded(
              child: TextFormField(
            textAlign: TextAlign.start,
            onEditingComplete: () {},
            focusNode: null,
            autofocus: false,
            readOnly: false,
            keyboardType: null,
            obscureText: false,
            textInputAction: null,
            controller: null,
            validator: null,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
              height: 1.3.r,
            ),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(bottom: 0.0, top: 15.0.r, left: 8.w),
              errorMaxLines: 2,
              errorStyle: TextStyle(color: Colors.red),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent, width: 0.0),
              ),
              hintText: 'Enter email',
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              enabledBorder: outlineBorder(),
              focusedBorder: outlineBorder(),
              border: outlineBorder(),
            ),
          )),
          // isSuffixIcon
          //     ? IconButton(
          //         onPressed: onPressed,
          //         icon: Icon(
          //           suffixIcon,
          //           color: AppColor.PRIMARY_COLOR,
          //         ),
          //       )
          //     : const SizedBox(),
        ],
      ),
    );
  }
}

OutlineInputBorder outlineBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(color: Colors.transparent),
  );
}
