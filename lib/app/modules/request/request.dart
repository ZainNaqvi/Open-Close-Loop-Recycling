import 'package:flutter/material.dart';
import 'wigets/appbar.dart';
import 'wigets/body.dart';

class RequestView extends StatelessWidget {
  const RequestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: const Body(),
    );
  }
}
