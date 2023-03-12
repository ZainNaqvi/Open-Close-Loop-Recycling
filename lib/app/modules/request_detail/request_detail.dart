import 'package:flutter/material.dart';


import 'components/appbar.dart';
import 'components/body.dart';

class RequestDetail extends StatelessWidget {
  final data;
  const RequestDetail({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(data: data),
      appBar: appbar(),
    );
  }
}
