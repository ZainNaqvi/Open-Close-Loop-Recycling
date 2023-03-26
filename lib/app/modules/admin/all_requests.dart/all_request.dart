import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../widgets/request_tile.dart';
import '../../request_detail/request_detail.dart';

class TotalRequest extends StatelessWidget {
  const TotalRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
    title: const Text('Requests'),
    centerTitle: true,
    elevation: 0,
    backgroundColor: AppColors.PRIMARY_COLOR,
  
  ),
      body: Padding(
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
                "New Requests",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 18.h),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('waste_request')
                      .where('approved',
                          isEqualTo:false)
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
                        ? const Center(child: Text("There is no data to display."))
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) => RequstTIle(
                                  data: snapshot.data!.docs[index].data(),
                                  onTap: () {
                                    Get.to(RequestDetail(
                                      data: snapshot.data!.docs[index].data(),t: true,
                                    ));
                                  },
                                ));
                  }),
            
              SizedBox(height: 18.h),
              Text(
                "Approved Requests",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 18.h),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('waste_request')
                      .where('approved',
                          isEqualTo:true)
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
                        ? Column(
                          children: [
                            const Center(child: Text("None of the requests have been approved yet..")),
                            SizedBox(height: 24.h,),
                          ],
                        )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) => RequstTIle(
                                  data: snapshot.data!.docs[index].data(),
                                  onTap: () {
                                    Get.to(RequestDetail(
                                      data: snapshot.data!.docs[index].data(),t: true,
                                    ));
                                  },
                                ));
                  })
            
            ],
          ),
        ),
      ),
    );
  }
}
