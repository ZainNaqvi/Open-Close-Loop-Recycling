import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/controller/generic_loader.dart';
import 'package:open_close_loop_recycling/app/controller/home_controller.dart';
import 'package:open_close_loop_recycling/app/routes/routes.dart';
import 'package:uuid/uuid.dart';

import '../../model/user_request_model.dart';

class FirebaseFirestoreServices {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> getUserData() async {
    DocumentSnapshot doc = await _firebaseFirestore
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return (doc.data() as dynamic)['role'].toString();
  }

  Future<String> onUserRequest({
    required String address,
    required String trashType,
    required String dumperSize,
    required String date,
    required String time,
    required String message,
  }) async {
    String res = "Some error Occured";
    try {
      Get.find<GenericLoader>().onLoading(true);
      String postId = const Uuid().v1();
      WasteRequest userPost = WasteRequest(
        name: Get.find<HomeController>().userCreditialsData[0].name.toString(),
        uid: _auth.currentUser!.uid,
        address: address,
        approved: false,
        trashType: trashType,
        dumperSize: dumperSize,
        date: date,
        time: time,
        message: message,
      );
      _firebaseFirestore
          .collection("waste_request")
          .doc(postId)
          .set(userPost.toJson());
      res = "success";
      Get.offAllNamed(AppRoutes.HOME_ROUTE);
    } on FirebaseAuthException catch (e) {
      
      Get.offAllNamed(AppRoutes.HOME_ROUTE);
      if (e.code == 'permission-denied') {
        res = "denied";
        //You don't have permission to upload data to Firestore.
      } else {
        res = "Internal Server Error";
        //There was a problem uploading data to Firestore. Please try again later.
      }
    }
    return res;
  }
}
