import 'package:cloud_firestore/cloud_firestore.dart';

class UserCreditials {
  final String name;
  final String email;
  final String uid;
  final String role;

  // final List cart;
  // creating the constructor here...
  UserCreditials({
    required this.name,
    required this.email,
    required this.uid,
    required this.role,
  });
  // converting it to the map object
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'uid': uid,
        'role': role,
      };
  static UserCreditials fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return UserCreditials(
      name: snapshot['name'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      role: snapshot['role'],
    );
  }
}
