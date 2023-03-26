import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/services/auth/firebase_firestore.dart';
import 'package:intl/intl.dart';
import '../widgets/generic_snake_bar.dart';

class RequestController extends GetxController {
  TextEditingController addressController = TextEditingController();
  TextEditingController trashTypeController = TextEditingController();
  TextEditingController dumperSizeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  FirebaseFirestoreServices services = FirebaseFirestoreServices();

  bool isLoading = false;
  updateIsLoading() {
    isLoading = !isLoading;
    update();
  }

  Future<void> onUserRequest() async {
    final response = await services.onUserRequest(
      address: addressController.text,
      trashType: trashTypeController.text,
      dumperSize: dumperSizeController.text,
      date: dateController.text,
      time: timeController.text,
      message: messageController.text,
    );

    if (response == 'success') {
      GenericSnackBar(text: "Your Request Submitted Successfully!");
    } else {
      GenericSnackBar(text: "Internal Error Please Try Again");
    }
    update();
  }

  callCalender(
    BuildContext context,
  ) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
                textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Get.isDarkMode
                    ? Colors.white
                    : Colors.black, // button text color
              ),
            )),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      dateController.text = formattedDate;
      update();
    }
  }

  getUserTIme() async {
    var userPickTime = await onShowTimePicker();
    String formatedTime = userPickTime.format(Get.context!);
    if (userPickTime == null) {
      GenericSnackBar(text: "Time is not valid time cancelled");
    } else {
      _startTime = formatedTime;
      timeController.text = _startTime;

      print(_startTime);
    }
    update();
  }

  onShowTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: Get.context!,
        initialTime: TimeOfDay.now());
  }
}
