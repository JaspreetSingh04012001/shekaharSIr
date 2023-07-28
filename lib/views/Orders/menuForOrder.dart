import 'package:admin/controllers/inventoryController.dart';
import 'package:admin/reuseable%20Widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_styles_colors.dart';
import '../Menu/addItem.dart';

class MenuForOrder extends StatefulWidget {
  const MenuForOrder({Key? key}) : super(key: key);

  @override
  _MenuForOrderState createState() => _MenuForOrderState();
}

class _MenuForOrderState extends State<MenuForOrder> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return GetBuilder<InventoryController>(builder: (inventoryController) {
      return Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
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
              child: inventoryController.items == null
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
                                Get.to(const AddItem());
                              },
                              buttonText: " Add Item ",
                              alignment: null,
                            )
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: inventoryController.items?.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        Color color = Colors.white;
                        Color textColor = Colors.black;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 1),
                          child: Container(
                            decoration: BoxDecoration(
                                color: color,
                                borderRadius: Styles.myradius2,
                                boxShadow: Styles.myShadow),
                            width: width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
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
                                            "${inventoryController.items![index].autoCode}",
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
                                            "${inventoryController.items![index].itemname}",
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
                                            "Rs.${inventoryController.items![index].rate} ${inventoryController.items![index].sellUom ?? ''}",
                                            style: Styles.poppins14
                                                .copyWith(color: textColor),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (inventoryController
                                          .items![index].variations !=
                                      null)
                                    Column(
                                      children: inventoryController
                                          .items![index].variations!
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
                                                        style: Styles.poppins14
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
                                                        style: Styles.poppins14
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
                        );
                      }),
            ),
          ],
        ),
      );
    });
  }
}
