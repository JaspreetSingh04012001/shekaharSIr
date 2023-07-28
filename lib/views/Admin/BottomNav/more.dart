import 'package:admin/controllers/outletsController.dart';
import 'package:admin/views/OutletManager/Manage%20Stewards/stewards.dart';
import 'package:admin/views/OutletManager/addDepartment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_styles_colors.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutletsController>(builder: (outletsController) {
      return Scaffold(
        body: Column(
          children: [
            InkWell(
              onTap: () {
                // ignore: prefer_const_constructors
                Get.to(Stewards()
                    //   CaptainsQrcodes(
                    //   data: jsonEncode({
                    //     'token': '89898989898',
                    //     'outletId': outletsController.selelctedOutlet,
                    //     'CaptainId': '69',
                    //     'Captain Name': 'jass'
                    //   }),
                    // )
                    );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: Styles.myShadow,
                      color: Colors.white,
                      borderRadius: Styles.myradius2),
                  child: ListTile(
                    leading: const Icon(
                      Icons.person_add,
                      color: Color.fromARGB(255, 164, 14, 3),
                      size: 20,
                    ),
                    title: Text(
                      "Manage Stewards",
                      style: Styles.poppins12
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(AddDepartment(
                  department: false,
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: Styles.myShadow,
                      color: Colors.white,
                      borderRadius: Styles.myradius2),
                  child: ListTile(
                    leading: const Icon(
                      Icons.receipt,
                      color: Color.fromARGB(255, 164, 14, 3),
                      size: 20,
                    ),
                    title: Text(
                      "Define Categories",
                      style: Styles.poppins12
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
