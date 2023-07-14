import 'package:admin/controllers/outletsController.dart';
import 'package:admin/views/OutletManager/managerBottomNav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagerHome extends StatelessWidget {
  const ManagerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutletsController>(builder: (outletsController) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: outletsController
              .managerNavPages[outletsController.bottomTabIndex],
        ),
        bottomNavigationBar: const ManagerBottomNav(),
      );
    });
  }
}
