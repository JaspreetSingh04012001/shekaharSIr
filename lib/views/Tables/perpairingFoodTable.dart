import 'package:admin/Models/table.dart' as t;
import 'package:admin/controllers/OrdersController.dart';
import 'package:admin/controllers/tablesController.dart';
import 'package:admin/reuseable%20Widgets/animated_dialog.dart';
import 'package:admin/reuseable%20Widgets/customButton.dart';
import 'package:admin/views/Orders/viewOrder.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../common/app_styles_colors.dart';
import '../../controllers/storageController.dart';

class PerpairingFoodTable extends StatefulWidget {
  t.Table table;
  String tableId;
  String? orderId;

  String imageLink;
  String type;
  String tittle;
  PerpairingFoodTable(
      {Key? key,
      this.orderId,
      required this.table,
      required this.tableId,
      required this.imageLink,
      required this.type,
      required this.tittle})
      : super(key: key);

  @override
  State<PerpairingFoodTable> createState() => _PerpairingFoodTableState();
}

class _PerpairingFoodTableState extends State<PerpairingFoodTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        // height: 200,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 196, 237, 198),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "TableId : ${widget.tableId}",
              //  style: Styles.poppins16w400,
            ),
            if (widget.orderId != null)
              Text(
                "OrderId : ${widget.orderId}",
                style: Styles.poppins14,
              ),
            Text(
              widget.tittle,
              style: Styles.poppins16w400
                  .copyWith(color: Colors.green, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Lottie.network(
              widget.imageLink,
              height: 80,
              fit: BoxFit.contain,
            ),
            Text(
              widget.type,
              //  style: Styles.poppins16w400,
            ),
            const Gap(3),
            GetBuilder<OrdersController>(builder: (ordersController) {
              return CustomButton(
                onTap: () {
                  ordersController.orders!.firstWhere((element) {
                    if (element.orderId == widget.orderId) {
                      Get.to(ViewOrder(order: element));
                      return true;
                    } else {
                      return false;
                    }
                  });
                  // Get.to(ViewOrder(order: o));
                },
                shadow: false,
                verPad: 0,
                buttonText: "View",
                color: Colors.orange,
              );
            }),
            CustomButton(
              onTap: () {
                showAnimatedDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      bool allowClear = false;
                      if (widget.orderId == null) {
                      } else {
                        Get.find<OrdersController>().orders!.firstWhere(
                          (element) {
                            if (element.tableID == widget.tableId &&
                                element.orderId == widget.orderId) {
                              allowClear = element.paymentStatus;
                              return true;
                            } else {
                              return false;
                            }
                          },
                        );
                      }

                      return AlertDialog(
                        // actionsPadding: EdgeInsets.zero,
                        title: Text(
                          "Clear Table id ${widget.table.id}",
                          style: Styles.poppins16w400.copyWith(
                              fontWeight: FontWeight.bold
                              // color: allowClear ? Colors.green : Colors.red
                              ),
                        ),
                        content: Text(
                            allowClear
                                ? "No payment due on this table"
                                : "Payment is due on this table, are you sure you want to clear the table\n\nIf you click No due Order will be considered with no payment pending",
                            style: Styles.poppins14w400.copyWith(
                                fontWeight: FontWeight.bold,
                                color: allowClear ? Colors.green : Colors.red)),
                        actions: [
                          Row(
                            children: [
                              Expanded(
                                  child: CustomButton(
                                horPad: 0,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                buttonText: "Cancel",
                                color: Colors.white,
                                textColor: Colors.orange,
                              )),
                              const Gap(5),
                              Expanded(
                                child: CustomButton(
                                  onTap: () {
                                    var tablesController =
                                        Get.find<TablesController>();
                                    var storageController =
                                        Get.find<StorageController>();
                                    if (widget.orderId == null && !allowClear) {
                                      widget.table.isFoodprepairing = false;
                                      widget.table.orderId = null;

                                      tablesController.tables!
                                          .firstWhere((element) {
                                        if (element.id == widget.table.id) {
                                          tablesController.tables![
                                                  tablesController.tables!
                                                      .indexOf(element)] =
                                              widget.table;
                                          return true;
                                        } else {
                                          return false;
                                        }
                                      });
                                      tablesController.update();

                                      storageController.updateTablesInStorage(
                                          tablesController.tables!);
                                      //   tablesController.updateTables();
                                      Navigator.pop(context);
                                    }
                                    if (widget.orderId != null && !allowClear) {
                                      var ordersController =
                                          Get.find<OrdersController>();
                                      widget.table.isFoodprepairing = false;
                                      ordersController.orders!
                                          .firstWhere((element) {
                                        if (element.orderId == widget.orderId) {
                                          ordersController
                                              .orders![ordersController.orders!
                                                  .indexOf(element)]
                                              .paymentStatus = true;
                                          ordersController
                                              .orders![ordersController.orders!
                                                  .indexOf(element)]
                                              .tableCleared = true;

                                          ordersController.update();
                                          storageController
                                              .updateOrdersInStorage();

                                          return true;
                                        } else {
                                          return false;
                                        }
                                      });

                                      widget.table.orderId = null;

                                      tablesController.tables!
                                          .firstWhere((element) {
                                        if (element.id == widget.table.id) {
                                          tablesController.tables![
                                                  tablesController.tables!
                                                      .indexOf(element)] =
                                              widget.table;
                                          return true;
                                        } else {
                                          return false;
                                        }
                                      });
                                      tablesController.update();
                                      Get.find<StorageController>()
                                          .updateTablesInStorage(
                                              tablesController.tables!);
                                      //   tablesController.updateTables();
                                      Navigator.pop(context);
                                    }
                                    if (allowClear && widget.orderId != null) {
                                      widget.table.isFoodprepairing = false;
                                      widget.table.orderId = null;

                                      tablesController.tables!
                                          .firstWhere((element) {
                                        if (element.id == widget.table.id) {
                                          tablesController.tables![
                                                  tablesController.tables!
                                                      .indexOf(element)] =
                                              widget.table;
                                          return true;
                                        } else {
                                          return false;
                                        }
                                      });
                                      tablesController.update();

                                      storageController.updateTablesInStorage(
                                          tablesController.tables!);
                                      //   tablesController.updateTables();
                                      Navigator.pop(context);
                                    }
                                  },
                                  horPad: 0,
                                  color: allowClear
                                      ? const Color.fromARGB(255, 50, 118, 52)
                                      : Colors.indigo[900],
                                  buttonText: allowClear ? "Clear" : "No Due",
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    });
              },
              buttonText: "Clear",
              shadow: false,
            )
          ],
        ),
      ),
    );
  }
}
