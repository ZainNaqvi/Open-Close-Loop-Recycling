import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String? id;
  final String? notificationId;
  final String? requestId;
  final String? message;
  final bool? read;
  final Timestamp timestamp;

  NotificationModel({
    required this.id,
    required this.notificationId,
    required this.message,
    required this.requestId,
    required this.read,required this.timestamp,
  });
  Map<String, dynamic> toJson() => {
        'uid': id,
        'notification_id': notificationId,
        'message': message,
        'read': read,
        'request_id': requestId,
        'timestamp': timestamp,
     
      };
  static NotificationModel fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return NotificationModel(
      id: snapshot['uid'],
      notificationId: snapshot['notification_id'],
      requestId: snapshot['request_id'],
      message: snapshot['message'],
      read: snapshot['read'],
      timestamp: snapshot['timestamp'],
     
    );
  }
}
