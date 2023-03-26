import 'package:flutter/material.dart';
import 'wigets/appbar.dart';
import 'wigets/body.dart';

class NotificationView extends StatelessWidget {

   NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body:  Body(),
    );
  }
}
