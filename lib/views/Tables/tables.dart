import 'package:admin/controllers/outletsController.dart';
import 'package:admin/reuseable%20Widgets/customButton.dart';
import 'package:admin/views/Tables/vacantTables.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

import '../../common/app_styles_colors.dart';
import '../../reuseable Widgets/animated_dialog.dart';

class Tables extends StatefulWidget {
  const Tables({Key? key}) : super(key: key);

  @override
  _TablesState createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return GetBuilder<OutletsController>(builder: (outletsController) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: outletsController.selelctedOutlet!.tables!
                      .map(
                        (e) => VacantTables(
                          image: 'assets/delivery.png',
                          number: 3,
                          type: 'Delivery',
                        ),
                      )
                      .toList(),
                  //  [
                  //   InkWell(
                  //     onTap: () {
                  //   //    Get.to(Test());
                  //       Get.to(TableOrder());
                  //       // Navigator.of(context)
                  //       //     .push(MaterialPageRoute(builder: (context) {
                  //       //   return const TableOrder();
                  //       // }));
                  //     },
                  //     child: VacantTables(
                  //       image: 'assets/1.jpg',
                  //       number: 1,
                  //       type: 'Normal',
                  //     ),
                  //   ),
                  //   VacantTables(
                  //     image: 'assets/fastfood.png',
                  //     number: 2,
                  //     type: 'Fast Food',
                  //   ),
                  //   VacantTables(
                  //     image: 'assets/delivery.png',
                  //     number: 3,
                  //     type: 'Delivery',
                  //   ),
                  //   PerpairingFoodTable(
                  //     tittle: "Oder Preparing",
                  //     imageLink:
                  //         'https://assets2.lottiefiles.com/packages/lf20_vkqybeu5/data.json',
                  //     number: 4,
                  //     type: 'Normal',
                  //   ),
                  //   PerpairingFoodTable(
                  //     tittle: "Prepairing",
                  //     imageLink:
                  //         'https://assets8.lottiefiles.com/packages/lf20_s5tFhoBEWg.json',
                  //     number: 5,
                  //     type: 'Fast Food',
                  //   ),
                  //   PerpairingFoodTable(
                  //     tittle: "Delivering",
                  //     imageLink:
                  //         'https://assets3.lottiefiles.com/packages/lf20_s3apehpd.json',
                  //     number: 5,
                  //     type: 'Delivery',
                  //   ),
                  // ],
                ),
              ),
              const Gap(20)
            ],
          ),
        ),
        floatingActionButton: SpeedDial(
          closedForegroundColor: Colors.black,
          openForegroundColor: Colors.white,
          closedBackgroundColor: Colors.white,
          openBackgroundColor: Colors.black,
          labelsStyle: Styles.poppins16w400,
          labelsBackgroundColor: Colors.white,
          // controller: /* Your custom animation controller goes here */,
          speedDialChildren: <SpeedDialChild>[
            SpeedDialChild(
              child: const Icon(Icons.table_restaurant_rounded),
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              label: 'Add Table',
              onPressed: () {
                showAnimatedDialog(
                    barrierDismissible: true,
                    context: context,
                    animationType: DialogTransitionType.slideFromBottomFade,
                    builder: (context) {
                      bool isComplimentary = false;
                      bool isNormal = false;
                      bool isFastFood = false;
                      bool isDelivery = false;
                      return AlertDialog(content:
                          StatefulBuilder(builder: (context, setState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Table no. ${outletsController.provideNewTableId().toString()}',
                                  style: Styles.poppins16w400,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.cancel,
                                      color: Styles.primaryColor,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      side: const BorderSide(
                                        width: 3,
                                        color: Colors
                                            .black, // Add a border to make it more visible
                                      ),
                                    ),
                                    activeColor: Colors
                                        .green, // Customize the checkbox's color when checked
                                    checkColor: Colors
                                        .white, // Customize the check icon's color
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      // Customize the checkbox's color when unchecked
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return Colors
                                            .green; // Make it semi-transparent when unchecked
                                      }
                                      return Colors.black;
                                    }),
                                    value: isNormal,
                                    onChanged: (v) {
                                      setState(() {
                                        isNormal = !isNormal;
                                        if (isNormal) {
                                          isComplimentary = false;
                                          isDelivery = false;
                                          isFastFood = false;
                                        }
                                      });
                                    }),
                                // const Gap(5),
                                Text(
                                  "Normal",
                                  style: Styles.poppins14,
                                )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      side: const BorderSide(
                                        width: 3,
                                        color: Colors
                                            .black, // Add a border to make it more visible
                                      ),
                                    ),
                                    activeColor: Colors
                                        .green, // Customize the checkbox's color when checked
                                    checkColor: Colors
                                        .white, // Customize the check icon's color
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      // Customize the checkbox's color when unchecked
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return Colors
                                            .green; // Make it semi-transparent when unchecked
                                      }
                                      return Colors.black;
                                    }),
                                    value: isFastFood,
                                    onChanged: (v) {
                                      setState(() {
                                        isFastFood = !isFastFood;
                                        if (isFastFood) {
                                          isComplimentary = false;
                                          isDelivery = false;
                                          isNormal = false;
                                        }
                                      });
                                    }),
                                // const Gap(5),
                                Text(
                                  "Fast food",
                                  style: Styles.poppins14,
                                )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      side: const BorderSide(
                                        width: 3,
                                        color: Colors
                                            .black, // Add a border to make it more visible
                                      ),
                                    ),
                                    activeColor: Colors
                                        .green, // Customize the checkbox's color when checked
                                    checkColor: Colors
                                        .white, // Customize the check icon's color
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      // Customize the checkbox's color when unchecked
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return Colors
                                            .green; // Make it semi-transparent when unchecked
                                      }
                                      return Colors.black;
                                    }),
                                    value: isDelivery,
                                    onChanged: (v) {
                                      setState(() {
                                        isDelivery = !isDelivery;
                                        if (isDelivery) {
                                          isComplimentary = false;
                                          isNormal = false;
                                          isFastFood = false;
                                        }
                                      });
                                    }),
                                // const Gap(5),
                                Text(
                                  "Delivery",
                                  style: Styles.poppins14,
                                )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                      side: const BorderSide(
                                        width: 3,
                                        color: Colors
                                            .black, // Add a border to make it more visible
                                      ),
                                    ),
                                    activeColor: Colors
                                        .green, // Customize the checkbox's color when checked
                                    checkColor: Colors
                                        .white, // Customize the check icon's color
                                    fillColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      // Customize the checkbox's color when unchecked
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return Colors
                                            .green; // Make it semi-transparent when unchecked
                                      }
                                      return Colors.black;
                                    }),
                                    value: isComplimentary,
                                    onChanged: (v) {
                                      setState(() {
                                        isComplimentary = !isComplimentary;
                                        if (isComplimentary) {
                                          isDelivery = false;
                                          isNormal = false;
                                          isFastFood = false;
                                        }
                                      });
                                    }),
                                // const Gap(5),
                                Text(
                                  "Complimentry",
                                  style: Styles.poppins14,
                                )
                              ],
                            ),
                            CustomButton(buttonText: "Add")
                          ],
                        );
                      }));
                    });
                // Get.to(const AddItem());
              },
              closeSpeedDialOnPressed: true,
            ),
            SpeedDialChild(
              child: const Icon(Icons.delete),
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              label: 'Remove Table',
              onPressed: () {
                // Get.to(const DeleteItem());
              },
            ),

            //  Your other SpeedDialChildren go here.
          ],
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
