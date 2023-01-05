import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFirestoreServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
// Crud - Rest - Apis - Firebase
  Future<String> getUserData() async {
    DocumentSnapshot _doc = await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return (_doc.data() as dynamic)['role'].toString();
  }
}
