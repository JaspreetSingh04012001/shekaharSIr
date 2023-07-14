import 'package:admin/common/app_styles_colors.dart';
import 'package:admin/controllers/outletsController.dart';
import 'package:admin/views/Captain/capatainBottomNav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CaptainHome extends StatelessWidget {
  const CaptainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutletsController>(builder: (outletsController) {
      return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              outletsController.selelctedOutlet!.outletName ?? "",
              style: Styles.poppins12,
            )),
        body:
            outletsController.captainNavPages[outletsController.bottomTabIndex],
        bottomNavigationBar: const CapatainBottomNav(),
      );
    });
  }
}
