import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/services/auth/firebase_firestore.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../widgets/payment_slip_dialog.dart';
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h),
            widget.t
                ? GenericButton(
                    onTap: () async {
                      if (widget.data['imageUrl'] != 'null') {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Waste Management',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Stack(
                                      children: [
                                        Image.network(
                                          widget.data['imageUrl'],
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null)
                                              return child;
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        // Show a snackbar indicating that the image has not been uploaded yet
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Image not uploaded yet'),
                          ),
                        );
                      }
                    },
                    text: widget.data['imageUrl'] != 'null'
                        ? 'Check Payment Screenshot'
                        : 'Image Not Uploaded Yet!',
                  )
                : GenericButton(
                    isBackground: false,
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialog(
                              docId: widget.data['request_id'].toString());
                        },
                      );
                    },
                    text: widget.data['imageUrl'] != "null"
                        ? "Image Uploaded / Change"
                        : "Upload Payment Slip"),
            SizedBox(height: 16.h),
            Text(
              "Request Details",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 24.h),
            Tile(title: 'Name', value: widget.data['name'] ?? 'no-name'),
            SizedBox(height: 12.h),
            Tile(title: 'Address', value: widget.data['address']),
            SizedBox(height: 12.h),
            Tile(title: 'Type', value: widget.data['trash_type']),
            SizedBox(height: 12.h),
            Tile(title: 'Size', value: widget.data['dumper_size']),
            SizedBox(height: 12.h),
            Tile(title: 'Date', value: widget.data['date']),
            SizedBox(height: 12.h),
            Tile(title: 'Time', value: widget.data['time']),
            SizedBox(height: 12.h),
            Tile(title: 'Message', value: widget.data['message']),

            SizedBox(height: 14.h),

            widget.t
                ? isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : widget.data['approved']
                        ? GenericButton(
                            isBackground: false,
                            onTap: () async {},
                            text: 'Request is Approved')
                        : GenericButton(
                            onTap: () async {
                              await requestId(widget.data['request_id']);
                            },
                            text: 'Approve')
                : const SizedBox(),
            SizedBox(height: 4.h),
            widget.t
                ? TextButton(
                    onPressed: () async {
                      final url =
                          'https://www.google.com/maps/search/?api=1&query=${widget.data["lat"]},${widget.data["lan"]}';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.location_on_outlined),
                          Text('Location'),
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
            // const Spacer(),
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
                    ? const Center(
                        child: Text(
                        '*Request Approved!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 18),
                      ))
                    : const Center(
                        child: Text(
                        'Please wait for approval from the administrator.',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.redAccent,
                        ),
                      )),
            SizedBox(
              height: 8.h,
            )
          ],
        ),
      ),
    );
  }

  Future<void> requestId(String requestId) async {
    FirebaseFirestoreServices firebaseFirestoreServices =
        FirebaseFirestoreServices();
    setState(() {
      isLoading = true;
    });
    await firebaseFirestoreServices.updateNotification(
        requestId, 'The approval for this request has been granted.');

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
