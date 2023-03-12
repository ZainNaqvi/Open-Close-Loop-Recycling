import 'package:flutter/material.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_drawer.dart';
import 'components/appbar.dart';
import 'components/body.dart';

class AllRequestsScreen extends StatelessWidget {
  const AllRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: const MyDrawer(),
      body: const Body(),appBar: appbar(),);
  }
}