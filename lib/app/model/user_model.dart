import 'package:cloud_firestore/cloud_firestore.dart';

class UserCreditials {
  final name;
  final email;
  final uid;

  // final List cart;
  // creating the constructor here...
  UserCreditials({
    required this.name,
    required this.email,
    required this.uid,
  });
  // converting it to the map object
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'uid': uid,
      };
  static UserCreditials fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return UserCreditials(
      name: snapshot['name'],
      uid: snapshot['uid'],
      email: snapshot['email'],
    );
  }
}
