import 'package:admin/common/app_styles_colors.dart';
import 'package:admin/controllers/inventoryController.dart';
import 'package:admin/views/Menu/addItem.dart';
import 'package:admin/views/Menu/editItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 2;
    return GetBuilder<InventoryController>(builder: (inventoryController) {
      return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            // flexibleSpace: ,
            toolbarHeight: kToolbarHeight,
            titleSpacing: 0,
            leadingWidth: 0,
            title: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.1,
                  child: Text(
                    "Id",
                    style: Styles.poppins14w400,
                  ),
                ),
                Container(
                  //color: Colors.amber,
                  alignment: Alignment.center,
                  width: width * 0.45,
                  child: Text(
                    "Item",
                    style: Styles.poppins14w400,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.2,
                  child: Text(
                    "Rate",
                    style: Styles.poppins14w400,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.2,
                  child: Text(
                    "Quantity",
                    style: Styles.poppins14w400,
                  ),
                ),
              ],
            )),
        body: inventoryController.items == null
            ? Center(
                child: Text(
                  "No Items yet\nPlease add items",
                  style: Styles.poppins16w500,
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.builder(
                itemCount: inventoryController.items!.length,
                itemBuilder: (context, index) {
                  Color color = Colors.white;
                  Color textColor = Colors.white;
                  if (inventoryController.items![index].type == "Veg") {
                    color = const Color.fromARGB(255, 58, 139, 60);
                  }
                  if (inventoryController.items![index].type == "Non-Veg") {
                    color = Colors.red;
                  }
                  if (inventoryController.items![index].type == "Egg-Made") {
                    color = Colors.yellow;
                    textColor = Colors.black;
                  }
                  if (inventoryController.items![index].type == "") {
                    //color = Colors.yellow;
                    textColor = Colors.black;
                  }
                  return 
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 1),
                    child: Container(
                      width: width,
                      color: color,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: width * 0.1,
                                  child: Text(
                                    "${inventoryController.items![index].autoCode}",
                                    style: Styles.poppins14
                                        .copyWith(color: textColor),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: width * 0.45,
                                  child: Text(
                                    "${inventoryController.items![index].itemname}",
                                    style: Styles.poppins14
                                        .copyWith(color: textColor),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: width * 0.2,
                                  child: Text(
                                    "Rs.${inventoryController.items![index].rate} ${inventoryController.items![index].sellUom ?? ''}",
                                    style: Styles.poppins14
                                        .copyWith(color: textColor),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: width * 0.2,
                                  child: Text(
                                    inventoryController
                                                .items![index].isFinishedGood ??
                                            false
                                        ? "${inventoryController.items![index].qty}"
                                        : "--",
                                    style: Styles.poppins14
                                        .copyWith(color: textColor),
                                  ),
                                ),
                                // Container(
                                //   alignment: Alignment.center,
                                //   width: width * 0.1,
                                //   child: Text(
                                //     "${items[index]["FG"]}",
                                //     style:
                                //         Styles.poppins14.copyWith(color: textColor),
                                //   ),
                                // ),
                              ],
                            ),
                            if (inventoryController.items![index].variations !=
                                null)
                              Column(
                                children: inventoryController
                                    .items![index].variations!
                                    .map((e1) => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              width: width * 0.1,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              width: width * 0.45,
                                              child: Text(
                                                e1.variationName.toString(),
                                                style: Styles.poppins14
                                                    .copyWith(
                                                        color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              width: width * 0.2,
                                              child: Text(
                                                "Rs.${e1.rate}",
                                                style: Styles.poppins14
                                                    .copyWith(
                                                        color: Colors.white),
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
              child: const Icon(Icons.assignment_add),
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
              label: 'Add item in Menu',
              onPressed: () {
                Get.to( AddItem());
              },
              closeSpeedDialOnPressed: true,
            ),
            // SpeedDialChild(
            //   child: const Icon(Icons.remove_from_queue_rounded),
            //   foregroundColor: Colors.white,
            //   backgroundColor: Colors.red,
            //   label: 'Discontinue item from Menu',
            //   onPressed: () {
            //     // inventoryController.removeItem(0);
            //     // Get.to(const DeleteItem());
            //   },
            // ),
            SpeedDialChild(
              child: const Icon(Icons.edit),
              foregroundColor: Colors.white,
              backgroundColor: Colors.amber,
              label: 'Edit item on Menu',
              onPressed: () {
                Get.to(const EditItem());
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
