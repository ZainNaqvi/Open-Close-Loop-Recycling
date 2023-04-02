import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/controller/request_controller.dart';

import '../model/notification_model.dart';
import '../model/user_model.dart';
import '../routes/routes.dart';
import '../services/auth/firebase_auth.dart';
import '../widgets/generic_snake_bar.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    getCurrentPosition();
    getUserDetails();
  }

  List userCreditialsData = [];
  String? currentAddress;
  Position? currentPosition;

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;

      update();
    }).catchError((e) {
      debugPrint(e);
    });
    print('... ${currentPosition!.latitude} ${currentPosition!.longitude} ...');
    getAddressFromLatLng(currentPosition!);
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      Get.find<RequestController>().addressController.text = currentAddress!;
      update();
    }).catchError((e) {
      debugPrint(e);
    });
  }

  // Onloading -
  bool isloading = false;
  void updateIsLoading() {
    isloading = !isloading;
    update();
  }
  // **********************************************
  // ********** Firebase - Crud - Operations *******************
  //***********************************************

  // Creating - The - Object - DbHelper

  final DbHelper _dbHelper = DbHelper();

  // Creating - New - User - Here

  Future<void> signOut() async {
    updateIsLoading();
    String response = await _dbHelper.signOut();
    // Checking - Response ->
    if (response == 'success') {
      GenericSnackBar(text: "Successfully Signout!");
      Get.offAllNamed(AppRoutes.SIGN_IN_ROUTE);
      updateIsLoading();
    } else {
      updateIsLoading();
    }
  }

  // Selected - tab - inde
  int selectedTabIndex = 0;
  updateSelectedIndex(int index) {
    selectedTabIndex = index;
    update();
  }

  // Selected - Bottom - tab - inde
  int selectedBottomTabIndex = 0;
  updateSelectedBottomIndex(int index) {
    selectedBottomTabIndex = index;
    update();
  }

  Future<void> getUserDetails() async {
    // getting the current user by firebase auth
    userCreditialsData = [];
    User currentUser = FirebaseAuth.instance.currentUser!;

    //getting the data

    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("user")
        .doc(currentUser.uid)
        .get()
        .catchError(
      (onError) {
        print(onError);
      },
    );

    userCreditialsData.add(UserCreditials.fromSnap(snapshot));

    update();
  }

  Future<List<NotificationModel>> getUnreadNotifications() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('notification')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('read', isEqualTo: false)
        .get();

    List<NotificationModel> notifications = [];

    querySnapshot.docs.forEach((doc) {
      Timestamp timestamp = doc['timestamp'];
      NotificationModel notification = NotificationModel(
        requestId: doc['request_id'],
        notificationId: doc['notification_id'],
        id: doc.id,
        message: doc['message'],
        read: doc['read'],
        timestamp: Timestamp.fromDate(timestamp.toDate()),
      );

      notifications.add(notification);
    });

    return notifications;
  }

  Future<void> markNotificationAsRead(String notificationId) async {
    await FirebaseFirestore.instance
        .collection('notification')
        .doc(notificationId)
        .update({'read': true});
    update();
  }

  Future<List<NotificationModel>> getAllNotification() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('notification')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    List<NotificationModel> notifications = [];

    querySnapshot.docs.forEach((doc) {
      Timestamp timestamp = doc['timestamp'];
      NotificationModel notification = NotificationModel(
        requestId: doc['request_id'],
        notificationId: doc['notification_id'],
        id: doc.id,
        message: doc['message'],
        read: doc['read'],
        timestamp: Timestamp.fromDate(timestamp.toDate()),
      );

      notifications.add(notification);
    });

    return notifications;
  }
}
