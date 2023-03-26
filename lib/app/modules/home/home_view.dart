import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_close_loop_recycling/app/controller/home_controller.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_drawer.dart';
import 'widgets/appbar.dart';
import 'widgets/body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          drawer: const MyDrawer(),
          appBar: appbar(controller),
          body: const Body(),
        );
      }
    );
  }


}
