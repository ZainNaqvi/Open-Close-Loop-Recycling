import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/services/auth/firebase_firestore.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_button.dart';

import '../../../widgets/tile.dart';

class Body extends StatefulWidget {
  bool t;
  final data;
  Body({super.key, required this.data, required this.t});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Text(
            "Request Details",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 32.h),
          Tile(title: 'Name', value: widget.data['name'] ?? 'no-name'),
          SizedBox(height: 16.h),
          Tile(title: 'Address', value: widget.data['address']),
          SizedBox(height: 16.h),
          Tile(title: 'Type', value: widget.data['trash_type']),
          SizedBox(height: 16.h),
          Tile(title: 'Dumper', value: widget.data['dumper_size']),
          SizedBox(height: 16.h),
          Tile(title: 'Date', value: widget.data['date']),
          SizedBox(height: 16.h),
          Tile(title: 'Time', value: widget.data['time']),
          SizedBox(height: 24.h),
          widget.t
              ? isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : widget.data['approved']
                      ? SizedBox()
                      : GenericButton(
                          onTap: () async {
                            await requestId(widget.data['request_id']);
                          },
                          text: 'Approve')
              : const SizedBox(),
          const Spacer(),
          widget.t
              ? widget.data['approved']
                  ? const Center(
                      child: Text(
                      'The approval for this request has been granted.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ))
                  : const Center(
                      child: Text(
                      'The approval for this request is still pending.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ))
              : widget.data['approved']
                  ? const SizedBox()
                  : const Center(
                      child: Text(
                      'Please wait for approval from the administrator.',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    )),
          SizedBox(
            height: 8.h,
          )
        ],
      ),
    );
  }

  Future<void> requestId(String requestId) async {
    FirebaseFirestoreServices firebaseFirestoreServices =
        FirebaseFirestoreServices();
    setState(() {
      isLoading = true;
    });
    await firebaseFirestoreServices.updateNotification(requestId);

    await FirebaseFirestore.instance
        .collection('waste_request')
        .doc(requestId)
        .update({'approved': true});
    Get.snackbar('Message', 'Your request is approved successfully!');
    setState(() {
      isLoading = false;
    });
    Navigator.pop(context);
  }
}
