import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/controller/request_controller.dart';
import 'package:open_close_loop_recycling/app/modules/request_detail/request_detail.dart';


import '../../../widgets/request_tile.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                "Requests",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(height: 18.h),
              Text(
                "My Requests",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 18.h),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('waste_request')
                      .where('uid',
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    }
                    return snapshot.data!.docs.isEmpty
                        ? const Center(child: Text("No data is to display."))
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) => RequstTIle(
                                  data: snapshot.data!.docs[index].data(),
                                  onTap: () {
                                    Get.to(RequestDetail(data: snapshot.data!.docs[index].data() ,));
                                  },
                                ));
                  })
            ],
          ),
        ),
      );
    });
  }
}
