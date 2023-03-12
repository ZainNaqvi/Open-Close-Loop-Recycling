import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/controller/request_controller.dart';

import '../routes/routes.dart';
import '../services/auth/firebase_auth.dart';
import '../widgets/generic_snake_bar.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCurrentPosition();
  }

  String? _currentAddress;
  Position? _currentPosition;

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
      _currentPosition = position;

      update();
    }).catchError((e) {
      debugPrint(e);
    });
    getAddressFromLatLng(_currentPosition!);
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      _currentAddress =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      Get.find<RequestController>().addressController.text = _currentAddress!;
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
}
