import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/colors.dart';
import 'guide_lines_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AdminGuideLinesView extends StatelessWidget {
  const AdminGuideLinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.PRIMARY_COLOR,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.r),
              width: double.maxFinite,
              height: 92.h,
              decoration: BoxDecoration(
                color: AppColors.PRIMARY_COLOR,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18.r),
                  bottomRight: Radius.circular(18.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "GuideLines",
                    style: TextStyle(
                      color: AppColors.WHITE_COLOR,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "How to manage your wastes!",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.WHITE_COLOR,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 18.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                "Video Guidelines",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const GuideLinesForm());
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                width: double.maxFinite,
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: AppColors.PRIMARY_BACK_COLOR,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(children: [
                  SizedBox(width: 2.w),
                  SvgPicture.asset('assets/svg/gallery.svg'),
                  SizedBox(width: 12.w),
                  const Text(
                    "Upload New Video",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 8.h),
            GuideLinesVideos(),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}

class GuideLinesVideos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('guidelines').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              String videoTitle = snapshot.data!.docs[index].get('title');
              String videoUrl = snapshot.data!.docs[index].get('link');

              YoutubePlayerController _controller = YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                ),
              );

              return Padding(
                padding: EdgeInsets.only(bottom: 18.h,left: 12.w,right: 12.w),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: YoutubePlayer(
                        controller: _controller,
                        showVideoProgressIndicator: true,
                      ),
                    ),
                    Positioned(
                        bottom: 8,left: 12.w,
                        child: Text(
                          videoTitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              );
            });
      },
    );
  }
}
