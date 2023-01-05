import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/controller/request_controller.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_button.dart';

import '../../../widgets/generic_text_form_request_field.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GenericRequestFormFIeld(
              controller: TextEditingController(),
              hintText: "Type your address here",
              title: "Address",
            ),
            GenericRequestFormFIeld(
              controller: TextEditingController(),
              hintText: "Enter the type of trash here",
              title: "Trash Type",
            ),
            GenericRequestFormFIeld(
              controller: TextEditingController(),
              hintText: "Enter Dumper size here",
              title: "Dumper Size",
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Text(
                "Timing",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            GenericRequestFormFIeld(
              controller: TextEditingController(),
              hintText: "Select Date",
              title: "Date",
              suffixIcon: Icons.arrow_drop_down_outlined,
              readOnly: true,
            ),
            GenericRequestFormFIeld(
              controller: TextEditingController(),
              hintText: "Select Timing",
              title: "Time",
              suffixIcon: Icons.arrow_drop_down_outlined,
              readOnly: true,
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: Text(
                "Message",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            GenericRequestFormFIeld(
              controller: TextEditingController(),
              hintText: "Type your message here -Optional",
              title: "",
              maxLines: 10,
              height: 89.h,
            ),
            SizedBox(height: 25.h),
            GenericButton(onTap: () {}, text: "Send Request"),
            SizedBox(height: 22.h),
          ],
        ),
      );
    });
  }
}
