import 'package:cloud_firestore/cloud_firestore.dart';

class WasteRequest {
  final String? uid;
  final String? requestId;
  final String? name;
  final bool? approved;
  final String? address;
  final String? trashType;
  final String? dumperSize;
  final String? date;
  final String? time;
  final String? message;

  WasteRequest({
    required this.uid,
    required this.requestId,
    required this.name,
    required this.approved,
    required this.address,
    required this.trashType,
    required this.dumperSize,
    required this.date,
    required this.time,
    required this.message,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "request_id": requestId,
        "name": name,
        "approved": approved,
        "address": address,
        "trash_type": trashType,
        "dumper_size": dumperSize,
        "date": date,
        "time": time,
        "message": message,
      };
  static WasteRequest fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return WasteRequest(
      uid: snapshot['uid'],
      requestId: snapshot['request_id'],
      name: snapshot['name'],
      approved: snapshot['approved'],
      address: snapshot['address'],
      trashType: snapshot['trash_type'],
      dumperSize: snapshot['dumper_size'],
      date: snapshot['date'],
      time: snapshot['time'],
      message: snapshot['message'],
    );
  }
}
