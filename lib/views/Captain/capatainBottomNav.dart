import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/reusable widgets/myCustomBottomNav.dart';
import '../../controllers/outletsController.dart';

class CapatainBottomNav extends StatelessWidget {
  const CapatainBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutletsController>(builder: (outletsController) {
      return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 15,
              spreadRadius: 2,
              color: Colors.grey.shade300)
        ]),
        // color: Colors.amberAccent,
        height: 85,
        child: CustomLineIndicatorBottomNavbar(
          selectedIconSize: 25,
          unselectedIconSize: 23,
          selectedColor: const Color.fromARGB(255, 164, 14, 3),

          unSelectedColor: Colors.black54,
          backgroundColor: Colors.white,
          //splashColor: Colors.red,
          currentIndex: outletsController.bottomTabIndex,

          onTap: (index) {
            outletsController.setbottomTabIndex(index);
          },
          enableLineIndicator: true,
          lineIndicatorWidth: 4,
          indicatorType: IndicatorType.Top,

          // gradient: LinearGradient(
          //   colors: kGradients,
          // ),

          customBottomBarItems: [
            CustomBottomBarItems(
              label: 'Tables',
              icon: Icons.restaurant_menu_sharp,
            ),
            CustomBottomBarItems(
              label: 'Orders',
              icon: Icons.receipt_long,
            ),
            CustomBottomBarItems(
              label: 'More',
              icon: Icons.more_horiz,
            ),
          ],
        ),
      );
    });
  }
}
