import 'package:flutter/material.dart';

import 'components/appbar.dart';
import 'components/body.dart';

class RequestDetail extends StatelessWidget {
  final data;
  bool t;
  RequestDetail({super.key, required this.data, this.t = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(data: data, t: t),
      appBar: appbar(),
    );
  }
}
