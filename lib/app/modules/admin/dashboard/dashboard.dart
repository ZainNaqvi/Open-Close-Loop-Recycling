import 'package:flutter/material.dart';
import 'widgets/appbar.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
    );
  }
}
