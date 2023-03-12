import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      String postId = const Uuid().v1();
      WasteRequest userPost = WasteRequest(
        uid:_auth.currentUser!.uid,
        address: address,
        trashType: trashType,
        dumperSize: dumperSize,
        date: date,
        time: time,
        message: message,
      );
      _firebaseFirestore.collection("waste_request").doc(postId).set(userPost.toJson());
      res = "success";
    } on FirebaseAuthException catch (e) {
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
