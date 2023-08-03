import 'package:admin/Models/Order.dart';
import 'package:admin/common/reusable%20widgets/rightBoldText.dart';
import 'package:admin/controllers/OrdersController.dart';
import 'package:admin/controllers/cartController.dart';
import 'package:admin/controllers/outletsController.dart';
import 'package:admin/controllers/storageController.dart';
import 'package:admin/controllers/tablesController.dart';
import 'package:admin/reuseable%20Widgets/animated_dialog.dart';
import 'package:admin/reuseable%20Widgets/customButton.dart';
import 'package:admin/views/Admin/adminHome.dart';
import 'package:admin/views/Orders/itemAlertDailog.dart';
import 'package:admin/views/OutletManager/Manage%20Stewards/addSteward.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../Models/item.dart';
import '../../Models/steward.dart';
import '../../common/app_styles_colors.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Steward? selectedSteward;
  bool isPaymnetDone = false;
  double totalprice = 0.0;
  String? selectedValue;
  List<String> stewardNames = ['Self Service', '+ Add Steward'];
  String? selectedValue2;
  List<String> items2 = List.generate(31, (index) => index.toString());
  @override
  void initState() {
    selectedValue = stewardNames[0];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    for (var element
        in Get.find<OutletsController>().selelctedOutlet!.activeStewards!) {
      if (stewardNames.contains(element.Steward_Name)) {
      } else {
        stewardNames.add(element.Steward_Name.toString());
      }
    }
    return Scaffold(
      body: GetBuilder<CartController>(builder: (cartController) {
        double x = 0;
        if (cartController.tableKot[cartController.selectedTable!.id.toString()]
                ?.kotItems !=
            null) {
          for (var element in cartController
              .tableKot[cartController.selectedTable!.id.toString()]!
              .kotItems!) {
            x = x + double.parse(element.price.toString());
          }
          totalprice = x;
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(8),
                Text(
                  "Table Id ${cartController.selectedTable!.id}",
                  style: Styles.poppins16w400,
                ),
                const Gap(8),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Gap(5),
                    Text(
                      "Steward :",
                      style: Styles.poppins14,
                    ),
                    const Gap(5),
                    Expanded(
                      child: Container(
                        // padding: const EdgeInsets.symmetric(
                        //     horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 215, 215),
                          borderRadius: Styles.myradius2,
                          //boxShadow: Styles.myShadow
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            alignment: Alignment.center,
                            isDense: true,
                            isExpanded: true,
                            hint: Text(
                              'Select name',
                              style: Styles.poppins14,
                              overflow: TextOverflow.ellipsis,
                            ),
                            items: stewardNames
                                .map((String item) => DropdownMenuItem<String>(
                                      alignment: Alignment.center,
                                      value: item,
                                      child: Text(item,
                                          style: Styles.poppins14.copyWith(
                                            color: item == '+ Add Steward'
                                                ? Colors.green
                                                : Colors.black,
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                    ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              if (value == '+ Add Steward') {
                                showAnimatedDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: AddSteward(),
                                      );
                                    });
                              } else {
                                Get.find<OutletsController>()
                                    .selelctedOutlet!
                                    .activeStewards!
                                    .firstWhere(
                                  (element) {
                                    if (element.Steward_Name == value) {
                                      selectedSteward = element;
                                      return true;
                                    } else {
                                      return false;
                                    }
                                  },
                                );
                                setState(() {
                                  selectedValue = value;
                                });
                              }
                              //print(value);
                            },
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 1000,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              offset: const Offset(-20, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all(6),
                                thumbVisibility:
                                    MaterialStateProperty.all(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(5),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     children: [
                //       Container(
                //         padding: const EdgeInsets.symmetric(
                //             horizontal: 10, vertical: 4),
                //         child: Text(
                //           "Number of People :",
                //           style: Styles.poppins14,
                //         ),
                //       ),
                //       Expanded(
                //         child: Container(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 5, vertical: 4),
                //           decoration: BoxDecoration(
                //             color: const Color.fromARGB(255, 255, 215, 215),
                //             borderRadius: Styles.myradius2,
                //             //boxShadow: Styles.myShadow
                //           ),
                //           child: DropdownButtonHideUnderline(
                //             child: DropdownButton2<String>(
                //               isExpanded: true,
                //               alignment: Alignment.center,
                //               isDense: true,
                //               //  isExpanded: true,
                //               hint: Text(
                //                 'Select num',
                //                 style: Styles.poppins14,
                //                 overflow: TextOverflow.ellipsis,
                //               ),
                //               items: items2
                //                   .map((String item) =>
                //                       DropdownMenuItem<String>(
                //                         alignment: Alignment.center,
                //                         value: item,
                //                         child: Text(item,
                //                             style: Styles.poppins14.copyWith(
                //                               overflow: TextOverflow.ellipsis,
                //                             )),
                //                       ))
                //                   .toList(),
                //               value: selectedValue2,
                //               onChanged: (value) {
                //                 //print(value);
                //                 setState(() {
                //                   selectedValue2 = value;
                //                 });
                //               },

                //               dropdownStyleData: DropdownStyleData(
                //                 maxHeight: 1000,
                //                 width: 200,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(14),
                //                   color: Colors.white,
                //                 ),
                //                 offset: const Offset(-20, 0),
                //                 scrollbarTheme: ScrollbarThemeData(
                //                   radius: const Radius.circular(40),
                //                   thickness: MaterialStateProperty.all(6),
                //                   thumbVisibility:
                //                       MaterialStateProperty.all(true),
                //                 ),
                //               ),
                //               menuItemStyleData: const MenuItemStyleData(
                //                 height: 40,
                //                 padding: EdgeInsets.only(left: 14, right: 14),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Expanded(
                    child: cartController.tableKot[
                                cartController.selectedTable!.id.toString()] ==
                            null
                        ? Center(
                            child: Text(
                              "Order is Empty",
                              style: Styles.poppins14w400,
                            ),
                          )
                        : Container(
                            child: Column(
                              children: [
                                if (cartController.tableKot[cartController
                                        .selectedTable!.id
                                        .toString()] !=
                                    null)
                                  // Text(
                                  //   'KOT No. ' +
                                  //       cartController
                                  //           .tableKot[cartController
                                  //               .selectedTable!.id
                                  //               .toString()]!
                                  //           .KOTNo,
                                  //   style: Styles.poppins14w400.copyWith(
                                  //       color: Colors.green,
                                  //       fontWeight: FontWeight.bold),
                                  // ),
                                  Expanded(
                                    child: ListView.builder(
                                        itemCount: cartController
                                            .tableKot[cartController
                                                .selectedTable!.id
                                                .toString()]!
                                            .kotItems!
                                            .length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  cartController
                                                      .tableKot[cartController
                                                          .selectedTable!.id
                                                          .toString()]!
                                                      .kotItems![index]
                                                      .item!
                                                      .itemname
                                                      .toString(),
                                                  style: Styles.poppins14w400
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Styles
                                                              .primaryColor),
                                                ),
                                                if (cartController
                                                        .tableKot[cartController
                                                            .selectedTable!.id
                                                            .toString()]!
                                                        .kotItems![index]
                                                        .selectedVariation !=
                                                    null)
                                                  Text(
                                                    cartController
                                                        .tableKot[cartController
                                                            .selectedTable!.id
                                                            .toString()]!
                                                        .kotItems![index]
                                                        .selectedVariation!
                                                        .variationName
                                                        .toString(),
                                                    style: Styles.poppins14w400
                                                        .copyWith(
                                                            color: Styles
                                                                .primaryColor),
                                                  ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    RightBoldText(
                                                        title: "Quantity",
                                                        val: cartController
                                                            .tableKot[cartController
                                                                .selectedTable!
                                                                .id
                                                                .toString()]!
                                                            .kotItems![index]
                                                            .quantity),
                                                    Container(
                                                        color:
                                                            Colors.amberAccent,
                                                        child: Text(
                                                          ' Rs.${cartController.tableKot[cartController.selectedTable!.id.toString()]!.kotItems![index].price.toString()} ',
                                                          style: Styles
                                                              .poppins14
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .red),
                                                        )),

                                                    // Text(
                                                    //   'Rs.${cartController.tableKot[cartController.selectedTable!.id.toString()]!.kotItems![index].price.toString()}',
                                                    //   style: Styles.poppins14,
                                                    // )
                                                  ],
                                                ),
                                                const Gap(5),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        showDialog(
                                                            barrierDismissible:
                                                                false,
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                  shape: BeveledRectangleBorder(
                                                                      borderRadius:
                                                                          Styles
                                                                              .myradius2),
                                                                  content: ItemAlertDailog(
                                                                      indexofKotItem:
                                                                          index,
                                                                      item: cartController
                                                                              .tableKot[cartController.selectedTable!.id.toString()]!.kotItems![index].item
                                                                          as Item,
                                                                      isKotItem:
                                                                          true,
                                                                      kotItem: cartController
                                                                          .tableKot[cartController
                                                                              .selectedTable!
                                                                              .id
                                                                              .toString()]!
                                                                          .kotItems![index]));
                                                            });
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                16,
                                                                136,
                                                                20),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 1),
                                                          child: Text(
                                                            "    Edit    ",
                                                            style: Styles
                                                                .poppins14w400
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const Gap(5),
                                                    InkWell(
                                                      onTap: () {
                                                        cartController
                                                            .tableKot[cartController
                                                                .selectedTable!
                                                                .id
                                                                .toString()]!
                                                            .kotItems!
                                                            .removeAt(index);
                                                        cartController.update();
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Styles
                                                                .primaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        3)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 1),
                                                          child: Text(
                                                            "  Delete  ",
                                                            style: Styles
                                                                .poppins14w400
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                    // IconButton(
                                                    //     padding:
                                                    //         EdgeInsets.zero,
                                                    //     onPressed: () {},
                                                    //     icon: Icon(
                                                    //       Icons.edit,
                                                    //       color:
                                                    //           Styles.greenColor,
                                                    //     )),
                                                    // IconButton(
                                                    //     padding:
                                                    //         EdgeInsets.zero,
                                                    //     onPressed: () {},
                                                    //     icon: Icon(
                                                    //       Icons.delete,
                                                    //       color: Styles
                                                    //           .primaryColor,
                                                    //     )),
                                                  ],
                                                ),
                                                const Divider(
                                                  color: Color.fromARGB(
                                                      255, 183, 181, 181),
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                              ],
                            ),
                          )),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment Recieved ?",
                      style: Styles.poppins14w400,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                    .blue, // Customize the checkbox's color when checked
                                checkColor: Colors
                                    .white, // Customize the check icon's color
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  // Customize the checkbox's color when unchecked
                                  if (states.contains(MaterialState.selected)) {
                                    return Styles
                                        .primaryColor; // Make it semi-transparent when unchecked
                                  }
                                  return Colors.black;
                                }),
                                value: isPaymnetDone,
                                onChanged: (v) {
                                  setState(() {
                                    isPaymnetDone = !isPaymnetDone;
                                  });
                                }),
                            // const Gap(5),
                            Text(
                              "Yes",
                              style: Styles.poppins14,
                            ),
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
                                    .blue, // Customize the checkbox's color when checked
                                checkColor: Colors
                                    .white, // Customize the check icon's color
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  // Customize the checkbox's color when unchecked
                                  if (states.contains(MaterialState.selected)) {
                                    return Styles
                                        .primaryColor; // Make it semi-transparent when unchecked
                                  }
                                  return Colors.black;
                                }),
                                value: !isPaymnetDone,
                                onChanged: (v) {
                                  setState(() {
                                    isPaymnetDone = !isPaymnetDone;
                                  });
                                }),
                            // const Gap(5),
                            Text(
                              "No",
                              style: Styles.poppins14,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                RightBoldText(title: "Total", val: "Rs $totalprice"),
                GetBuilder<StorageController>(builder: (storageController) {
                  String tableId = cartController.selectedTable!.id.toString();
                  var tablesController = Get.find<TablesController>();
                  return CustomButton(
                    onTap: () async {
                      String orderId = Get.find<OrdersController>()
                          .assignOrderId()
                          .toString();
                      cartController.tableKot[tableId]?.KOTNo =
                          cartController.assignKotId();
                      cartController.tableKot[tableId]?.totalprice = totalprice;
                      cartController.update();

                      storageController.upadteKotsInStorage(
                          cartController.tableKot[tableId]!);
                      storageController.addOrderInStorage(Order.fromJson({
                        if (selectedSteward != null)
                          "steward": selectedSteward!.tojson(),
                        "orderId": orderId,
                        "date": cartController.tableKot[tableId]?.Date,
                        "time": cartController.tableKot[tableId]?.Time,
                        "tableID": tableId,
                        "paymentStatus": isPaymnetDone,
                        "totalprice": totalprice,
                        "kots": [cartController.tableKot[tableId]!.toJson()]
                      }));
                      Get.snackbar("Order Taken $orderId",
                          "Order taken on Table $tableId",
                          backgroundColor:
                              const Color.fromARGB(255, 63, 145, 66),
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 2));
                      tablesController.tables!.firstWhere((element) {
                        if (tableId == element.id) {
                          int indexx =
                              tablesController.tables!.indexOf(element);
                          tablesController.tables![indexx].isFoodprepairing =
                              true;
                          tablesController.tables![indexx].orderId = orderId;
                          return true;
                        } else {
                          return false;
                        }
                      });
                      tablesController.update();
                      Get.find<StorageController>()
                          .updateTablesInStorage(tablesController.tables!);
                      Future.delayed(const Duration(seconds: 3))
                          .whenComplete(() => Get.off(const AdminHome()));
                    },
                    // height: 30,
                    //width: double.infinity,
                    buttonText: "Place Order",
                  );
                })
              ],
            ),
          ),
        );
      }),
    );
  }
}
