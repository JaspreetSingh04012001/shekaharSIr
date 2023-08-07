import 'package:admin/common/reusable%20widgets/myDropdown.dart';
import 'package:admin/controllers/inventoryController.dart';
import 'package:admin/controllers/outletsController.dart';
import 'package:admin/reuseable%20Widgets/customButton.dart';
import 'package:admin/views/Orders/itemAlertDailog.dart';
import 'package:admin/views/OutletManager/addDepartment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/item.dart';
import '../../common/app_styles_colors.dart';
import '../../controllers/cartController.dart';
import '../../reuseable Widgets/animated_dialog.dart';
import '../Menu/addItem.dart';

class MenuForOrder extends StatefulWidget {
  const MenuForOrder({Key? key}) : super(key: key);

  @override
  _MenuForOrderState createState() => _MenuForOrderState();
}

class _MenuForOrderState extends State<MenuForOrder> {
  String? selectedCategory;
  String? filterKey = '';
  String? selectedType;
  final List<String> foodTypes = [
    'Veg',
    'Non-Veg',
    'Egg Made',
  ];
  String? selectedDepartment;
  final List<String> departements = [
    'kitchen',
    'Bar',
  ];

  List<Item>? items;
  void filter() async {
    items = Get.find<InventoryController>().items!.where(
      (element) {
        if ((element.itemname!.contains(filterKey ?? '') ||
            element.shortName!.contains(filterKey ?? ''))) {
          if (selectedType != null ||
              selectedCategory != null ||
              selectedDepartment != null) {
            if (selectedType != null &&
                selectedCategory != null &&
                selectedDepartment != null) {
              return element.type == selectedType &&
                  element.category == selectedCategory &&
                  element.department == selectedDepartment;
            } else {
              if (selectedType != null &&
                  selectedCategory == null &&
                  selectedDepartment == null) {
                return element.type == selectedType;
              }
              if (selectedType == null &&
                  selectedCategory != null &&
                  selectedDepartment == null) {
                return element.category == selectedCategory;
              }
              if (selectedType == null &&
                  selectedCategory == null &&
                  selectedDepartment != null) {
                return element.department == selectedDepartment;
              }

              if (selectedType != null &&
                  selectedCategory != null &&
                  selectedDepartment == null) {
                return element.type == selectedType &&
                    element.category == selectedCategory;
              }
              if (selectedType != null &&
                  selectedCategory == null &&
                  selectedDepartment != null) {
                return element.type == selectedType &&
                    element.department == selectedDepartment;
              }

              if (selectedType == null &&
                  selectedCategory != null &&
                  selectedDepartment != null) {
                return element.category == selectedCategory &&
                    element.department == selectedDepartment;
              } else {
                return false;
              }
            }
          } else {
            return true;
          }
        } else {
          return false;
        }
      },
    ).toList();
    /*String? department;
  String? category;
  String? type; */
    setState(() {});
  }

  @override
  void initState() {
    items = Get.find<InventoryController>().items;
    if (items != null) {
      filter();
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;

    return Material(
      child: GetBuilder<CartController>(builder: (cartController) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterKey = value;
                  filter();
                },
                // onChanged: _filterItems,
                decoration: InputDecoration(
                  //errorBorder: const InputBorder(),

                  errorStyle: Styles.poppins16w400.copyWith(color: Colors.red),
                  labelText: 'Search',
                  labelStyle: Styles.poppins16w400,
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: MyDropdown(
                    list: foodTypes,
                    selectedValue: selectedType,
                    onChanged: (value) {
                      //print(value);
                      setState(() {
                        selectedType = value;
                      });
                      filter();
                    },
                    labelText: 'Select Type',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: MyDropdown(
                    list: departements,
                    selectedValue: selectedDepartment,
                    onChanged: (value) {
                      //print(value);
                      setState(() {
                        selectedDepartment = value;
                      });
                      filter();
                    },
                    labelText: 'Select Department',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GetBuilder<OutletsController>(
                      builder: (outletsController) {
                    return MyDropdown(
                      list: outletsController.selelctedOutlet!.categories !=
                              null
                          ? [
                              ...?outletsController.selelctedOutlet!.categories,
                              '+ Add Category'
                            ]
                          : ['+ Add Category'],
                      selectedValue: selectedCategory,
                      onChanged: (value) {
                        //print(value);
                        if (value == '+ Add Category') {
                          showAnimatedDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: AddDepartment(
                                    department: false,
                                  ),
                                );
                              });
                        } else {
                          setState(() {
                            selectedCategory = value;
                          });
                          filter();
                        }
                      },
                      labelText: 'Select Category',
                    );
                  }),
                ),
                IconButton(
                  tooltip: "Reset",
                  icon: const Icon(Icons.restart_alt_outlined),
                  color: Styles.primaryColor,
                  onPressed: () {
                    selectedCategory = null;
                    selectedDepartment = null;
                    selectedType = null;
                    filter();
                  },
                )
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Id",
                      style: Styles.poppins16w400,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    //color: Colors.amber,
                    alignment: Alignment.center,

                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        "item",
                        style: Styles.poppins16w400,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Price",
                      style: Styles.poppins16w400,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            Expanded(
              child: items == null
                  ? Center(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "No items Added",
                              style: Styles.poppins14,
                            ),
                            CustomButton(
                              onTap: () {
                                Get.to(AddItem());
                              },
                              buttonText: " Add Item ",
                              alignment: null,
                            )
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: items?.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        Map<String, int> kotItemIndex = {};
                        bool inOrder = false;
                        List selectedIds = [];
                        if (cartController.tableKot.containsKey(
                            cartController.selectedTable!.id.toString())) {
                          cartController
                              .tableKot[
                                  cartController.selectedTable!.id.toString()]!
                              .kotItems
                              ?.asMap()
                              .forEach((index, element) {
                            kotItemIndex[element.item?.autoCode ?? ""] = index;
                            selectedIds.add(element.item?.autoCode);
                          });
                        }

                        Color color = Colors.white;
                        Color textColor = Colors.black;
                        if (selectedIds.contains(items![index].autoCode)) {
                          color = const Color.fromARGB(255, 255, 215, 215);
                          inOrder = true;
                        }

                        return InkWell(
                          onTap: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    shape: BeveledRectangleBorder(
                                        borderRadius: Styles.myradius2),
                                    content: inOrder
                                        ? ItemAlertDailog(
                                            indexofKotItem: kotItemIndex[
                                                items![index].autoCode],
                                            item: items![index],
                                            isKotItem: true,
                                            kotItem: cartController
                                                .tableKot[cartController
                                                    .selectedTable!.id
                                                    .toString()]!
                                                .kotItems![kotItemIndex[
                                                    items![index].autoCode] ??
                                                0],
                                          )
                                        : ItemAlertDailog(item: items![index]),
                                  );
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 1),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: Styles.myradius2.copyWith(),
                                  boxShadow: inOrder
                                      ? [
                                          const BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 249, 207, 207),
                                              spreadRadius: 2,
                                              blurRadius: 3,
                                              offset: Offset(0, 3))
                                        ]
                                      : Styles.myShadow),
                              width: width,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${items![index].autoCode}",
                                              style: Styles.poppins14
                                                  .copyWith(color: textColor),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: width * 0.45,
                                            child: Text(
                                              "${items![index].itemname}",
                                              style: Styles.poppins14
                                                  .copyWith(color: textColor),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: width * 0.2,
                                            child: Text(
                                              "Rs.${items![index].rate} ${items![index].sellUom ?? ''}",
                                              style: Styles.poppins14
                                                  .copyWith(color: textColor),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (items![index].variations != null)
                                      Column(
                                        children: items![index]
                                            .variations!
                                            .map((e1) => Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        // width: width * 0.45,
                                                        child: Text(
                                                          e1.variationName
                                                              .toString(),
                                                          style: Styles
                                                              .poppins14
                                                              .copyWith(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        //width: width * 0.2,
                                                        child: Text(
                                                          "Rs.${e1.rate}",
                                                          style: Styles
                                                              .poppins14
                                                              .copyWith(
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ))
                                            .toList(),
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
            ),
          ],
        );
      }),
    );
  }
}
