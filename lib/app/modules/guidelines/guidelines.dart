import 'package:flutter/material.dart';
import 'package:open_close_loop_recycling/app/widgets/generic_drawer.dart';
import 'wigets/appbar.dart';
import 'wigets/body.dart';

class GuideLines extends StatelessWidget {
  const GuideLines({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: appbar(),
        body: const Body(),
      ),
    );
  } // Logging - OUt


}
