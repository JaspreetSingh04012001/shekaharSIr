import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/reusable widgets/myCustomBottomNav.dart';
import '../../../controllers/outletsController.dart';

class AdminBottomnav extends StatelessWidget {
const AdminBottomnav({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GetBuilder<OutletsController>(builder: (outletsController){
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
                        currentIndex: outletsController.bottomTabIndexAllOutlets,

                        onTap: (index) {
                          outletsController.setbottomTabIndexAllOutlets(index);
                        },
                        enableLineIndicator: true,
                        lineIndicatorWidth: 5,
                        indicatorType: IndicatorType.Top,

                        // gradient: LinearGradient(
                        //   colors: kGradients,
                        // ),

                        customBottomBarItems: [
                          CustomBottomBarItems(
                            label: 'Sales',
                            icon: Icons.signal_cellular_alt,
                          ),
                          CustomBottomBarItems(
                              label: 'Supplier', icon: Icons.trolley),
                          CustomBottomBarItems(
                            label: 'More',
                            icon: Icons.more_horiz,
                          ),
                        ],
                      ),
                    );});
  }
}