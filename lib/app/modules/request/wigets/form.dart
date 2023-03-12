import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/controller/home_controller.dart';
import 'package:open_close_loop_recycling/app/controller/request_controller.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_button.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_text_field_validatior.dart';

import '../../../widgets/generic_text_form_request_field.dart';

class RequestFormWidget extends StatelessWidget {
  // Forgot - Password - Form - State
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RequestFormWidget({
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
              onPressed: ()=> Get.find<HomeController>().getCurrentPosition(),
              suffixIcon: Icons.location_on,
              validator: requiredValidator,
              controller: controller.addressController,
              hintText: "Type your address here",
              title: "Address",
            ),
            GenericRequestFormFIeld(
              validator: requiredValidator,
              controller: controller.trashTypeController,
              hintText: "Enter the type of trash here",
              title: "Trash Type",
            ),
            GenericRequestFormFIeld(
              validator: requiredValidator,
              controller: controller.dumperSizeController,
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
              validator: requiredValidator,
              onPressed: () => controller.callCalender(context),
              controller: controller.dateController,
              hintText: "Select Date",
              title: "Date",
              suffixIcon: Icons.arrow_drop_down_outlined,
              readOnly: true,
            ),
            GenericRequestFormFIeld(
              onPressed: () => controller.getUserTIme(),
              validator: requiredValidator,
              controller: controller.timeController,
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
              validator: requiredValidator,
              controller:controller.messageController,
              hintText: "Type your message here -Optional",
              title: "",
              maxLines: 6,
            ),
            SizedBox(height: 25.h),
            GenericButton(
                onTap: () async{
                  if (_formKey.currentState!.validate()) {
                  await  controller.onUserRequest();
                  } else {}
                },
                text: "Send Request"),
            SizedBox(height: 22.h),
          ],
        ),
      );
    });
  }
}
