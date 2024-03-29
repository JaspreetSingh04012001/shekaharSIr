import 'package:admin/Models/table.dart' as t;
import 'package:admin/common/reusable%20widgets/designedTextField.dart';
import 'package:admin/controllers/tablesController.dart';
import 'package:admin/reuseable%20Widgets/customButton.dart';
import 'package:admin/views/Tables/perpairingFoodTable.dart';
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
    return GetBuilder<TablesController>(builder: (tablesController) {
      return Scaffold(
        body: tablesController.tables == null
            ? Center(
                child: Text(
                  "No tables exist",
                  style: Styles.poppins14,
                ),
              )
            : SingleChildScrollView(
                child: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: tablesController.tables!.map((e) {
                      print(e.toJson());
                      if (e.isNormal as bool) {
                        return !(e.isFoodprepairing as bool)
                            ? VacantTables(
                                table: e,
                                tableId: e.id ?? '',
                                type: "Normal",
                                image: 'assets/1.jpg')
                            : PerpairingFoodTable(
                                table: e,
                                orderId: e.orderId,
                                tittle: "Oder Preparing",
                                imageLink:
                                    'https://assets2.lottiefiles.com/packages/lf20_vkqybeu5/data.json',
                                tableId: e.id ?? '',
                                type: 'Normal',
                              );
                      }
                      if (e.isFastFood as bool) {
                        return !(e.isFoodprepairing as bool)
                            ? VacantTables(
                                table: e,
                                tableId: e.id ?? '',
                                type: 'Fast Food',
                                image: 'assets/fastfood.png')
                            : PerpairingFoodTable(
                                table: e,
                                orderId: e.orderId,
                                tittle: "Prepairing",
                                imageLink:
                                    'https://assets8.lottiefiles.com/packages/lf20_s5tFhoBEWg.json',
                                tableId: e.id ?? '',
                                type: 'Fast Food',
                              );
                      }
                      if (e.isDelivery as bool) {
                        return !(e.isFoodprepairing as bool)
                            ? VacantTables(
                                table: e,
                                tableId: e.id ?? '',
                                type: 'Delivery',
                                image: 'assets/delivery.png')
                            : PerpairingFoodTable(
                                table: e,
                                orderId: e.orderId,
                                tittle: "Prepairing",
                                imageLink:
                                    'https://assets3.lottiefiles.com/packages/lf20_s3apehpd.json',
                                tableId: e.id ?? '',
                                type: 'Delivery',
                              );
                      }
                      if (e.isComplimentary as bool) {
                        return !(e.isFoodprepairing as bool)
                            ? VacantTables(
                                table: e,
                                tableId: e.id ?? '',
                                type: 'Complimentary',
                                image: 'assets/comp.jpg')
                            : PerpairingFoodTable(
                                table: e,
                                orderId: e.orderId,
                                tittle: "Prepairing",
                                imageLink:
                                    'https://assets3.lottiefiles.com/packages/lf20_s3apehpd.json',
                                tableId: e.id ?? '',
                                type: 'Complimentary',
                              );
                      } else {
                        return Container();
                      }
                    }).toList(),
                  ),
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
                    barrierDismissible: false,
                    context: context,
                    animationType: DialogTransitionType.slideFromBottomFade,
                    builder: (context) {
                      TextEditingController tableId = TextEditingController();
                      bool isComplimentary = false;
                      bool isNormal = false;
                      bool isFastFood = false;
                      bool isDelivery = false;
                      bool idAlreadyExists = false;

                      return AlertDialog(content:
                          StatefulBuilder(builder: (context, setState) {
                        final String id =
                            tablesController.provideNewTableId().toString();
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Text(
                                //   'Table no. $id',
                                //   style: Styles.poppins16w400,
                                // ),

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
                            DesignedTextField(
                              controller: tableId,
                              labelText: 'Enter table id',
                              onChanged: (p0) {
                                if (tablesController.tables != null) {
                                  if (tablesController.ids.contains(p0)) {
                                    setState(
                                      () {
                                        idAlreadyExists = true;
                                      },
                                    );
                                  } else {
                                    setState(
                                      () {
                                        idAlreadyExists = false;
                                      },
                                    );
                                  }
                                }
                              },
                              validate: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    idAlreadyExists) {
                                  return idAlreadyExists
                                      ? 'Id Already Exists'
                                      : 'Cannot be empty';
                                }
                                return null;
                              },
                            ),
                            idAlreadyExists
                                ? Text(
                                    "Id Already Exists",
                                    style: Styles.poppins14
                                        .copyWith(color: Colors.red),
                                  )
                                : Container(),
                            const Gap(5),
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
                            CustomButton(
                              buttonText: "Add",
                              onTap: () {
                                if ((isComplimentary ||
                                        isDelivery ||
                                        isNormal ||
                                        isFastFood) &&
                                    tableId.text.isNotEmpty) {
                                  //tablesController.addTable()
                                  tablesController.addTable(t.Table.fromJson({
                                    'AutoCode': tablesController.tables == null
                                        ? 0
                                        : tablesController.tables!.length,
                                    'Id': tableId.text.toString(),
                                    'isOcupied': false,
                                    'isComplimentary': isComplimentary,
                                    'isNormal': isNormal,
                                    'isFastFood': isFastFood,
                                    'isDelivery': isDelivery,
                                    'isFoodprepairing': false,
                                  }));
                                  // tablesController.addTable();
                                  Navigator.pop(context);
                                } else {
                                  Get.snackbar("Please select table type",
                                      "Table type cannot be empty",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white);
                                }
                              },
                            )
                          ],
                        );
                      }));
                    });
                // Get.to(const AddItem());
              },
              closeSpeedDialOnPressed: true,
            ),
            // SpeedDialChild(
            //   child: const Icon(Icons.delete),
            //   foregroundColor: Colors.white,
            //   backgroundColor: Colors.red,
            //   label: 'Discontinue  Table',
            //   onPressed: () {
            //     // Get.find<StorageController>().clearTableBox();
            //     showAnimatedDialog(
            //         barrierDismissible: false,
            //         context: context,
            //         animationType: DialogTransitionType.slideFromBottomFade,
            //         builder: (context) {
            //           List<String> roles = [];
            //           String? selectedrole;
            //           String? tableType;
            //           for (var element in tablesController.tables!) {
            //             roles.add(element.autoCode);
            //           }
            //           Map data = {};
            //           roles = roles.reversed.toList();
            //           return AlertDialog(
            //             content: StatefulBuilder(
            //                 builder: (context, StateSetter setState) {
            //               return Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Container(
            //                       padding: const EdgeInsets.symmetric(
            //                           vertical: 15, horizontal: 5),
            //                       decoration: BoxDecoration(
            //                         color: Colors.white,
            //                         borderRadius: Styles.myradius2,
            //                         //boxShadow: Styles.myShadow
            //                       ),
            //                       child: DropdownButtonHideUnderline(
            //                         child: DropdownButton2<String>(
            //                           alignment: Alignment.center,
            //                           //  isDense: true,
            //                           isExpanded: true,
            //                           hint: Text(
            //                             selectedrole ?? 'Select Table',
            //                             style: Styles.poppins14,
            //                             overflow: TextOverflow.ellipsis,
            //                           ),
            //                           items: roles
            //                               .map((String item) =>
            //                                   DropdownMenuItem<String>(
            //                                     alignment: Alignment.center,
            //                                     value: item,
            //                                     child: Text(item,
            //                                         style: Styles.poppins14
            //                                             .copyWith(
            //                                           // fontSize: 18,
            //                                           overflow:
            //                                               TextOverflow.ellipsis,
            //                                         )),
            //                                   ))
            //                               .toList(),
            //                           value: selectedrole,
            //                           onChanged: (value) {
            //                             print(value);
            //                             setState(() {
            //                               selectedrole = value;
            //                               tablesController.tables!.reversed
            //                                   .firstWhere((element) {
            //                                 if (element.autoCode == value) {
            //                                   data = element.toJson();
            //                                   if (data['isComplimentary']) {
            //                                     tableType =
            //                                         "Complimentary Table";
            //                                   }
            //                                   if (data['isNormal']) {
            //                                     tableType = "Normal Table";
            //                                   }
            //                                   if (data['isFastFood']) {
            //                                     tableType = "FastFood Table";
            //                                   }
            //                                   if (data['isDelivery']) {
            //                                     tableType = "Delivery Table";
            //                                   }

            //                                   return true;
            //                                 } else {
            //                                   return false;
            //                                 }
            //                               });
            //                             });
            //                           },

            //                           dropdownStyleData: DropdownStyleData(
            //                             maxHeight: 1000,
            //                             width: 100,
            //                             decoration: BoxDecoration(
            //                               borderRadius:
            //                                   BorderRadius.circular(14),
            //                               color: Colors.white,
            //                             ),
            //                             offset: const Offset(-20, 0),
            //                             scrollbarTheme: ScrollbarThemeData(
            //                               radius: const Radius.circular(40),
            //                               thickness:
            //                                   MaterialStateProperty.all(6),
            //                               thumbVisibility:
            //                                   MaterialStateProperty.all(true),
            //                             ),
            //                           ),
            //                           menuItemStyleData:
            //                               const MenuItemStyleData(
            //                             height: 40,
            //                             padding: EdgeInsets.only(
            //                                 left: 14, right: 14),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   if (tableType != null)
            //                     Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Text(
            //                         tableType.toString(),
            //                         style: Styles.poppins16w400,
            //                       ),
            //                     ),
            //                   CustomButton(
            //                     buttonText: "Delete table",
            //                     onTap: () {
            //                       if (data['isOcupied'] ||
            //                           data['isFoodprepairing']) {
            //                         Get.snackbar("Table is Busy",
            //                             "Either it is ocuupied or food is prepairing for it",
            //                             snackPosition: SnackPosition.BOTTOM,
            //                             backgroundColor: Colors.red,
            //                             colorText: Colors.white);
            //                       } else {
            //                         Get.snackbar(
            //                             "Table no. ${data['AutoCode']} removed",
            //                             "Table removed successfully",
            //                             snackPosition: SnackPosition.BOTTOM,
            //                             backgroundColor: Colors.green,
            //                             colorText: Colors.white);
            //                         Navigator.pop(context);
            //                       }
            //                     },
            //                   )
            //                 ],
            //               );
            //             }),
            //           );
            //         });
            //     // Get.to(const DeleteItem());
            //   },
            // ),

            //  Your other SpeedDialChildren go here.
          ],
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
