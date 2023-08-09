import 'package:admin/common/app_styles_colors.dart';
import 'package:admin/controllers/OrdersController.dart';
import 'package:admin/reuseable%20Widgets/customButton.dart';
import 'package:admin/views/Orders/viewOrder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagerOrders extends StatelessWidget {
  const ManagerOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Recent Orders",style: S,),
      // ),

      body: GetBuilder<OrdersController>(builder: (ordersController) {
        return ordersController.orders == null
            ? Center(
                child: Text(
                  "No orders exists",
                  style: Styles.poppins16w400,
                ),
              )
            : SingleChildScrollView(
                child: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: ordersController.orders!.reversed
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 2),
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: Styles.myradius2,
                                    boxShadow: Styles.myShadow),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Order Id : ${e.orderId}",
                                        style: Styles.poppins16w400,
                                      ),
                                      Text(
                                        "${e.date} ${e.time}",
                                        style: Styles.poppins16w400,
                                      ),
                                      Text(
                                        "Table id : ${e.tableID}",
                                        style: Styles.poppins16w400,
                                      ),
                                      Text("Total : ${e.totalprice}",
                                          style: Styles.poppins16w400),
                                      Text(
                                          "Serve : ${e.steward != null ? "${e.steward!.Steward_Name}" : "Self-serving"}",
                                          style: Styles.poppins16w400),
                                      Text(
                                          "Payment : ${e.paymentStatus ? "  Done  " : "Pending"}",
                                          style: Styles.poppins16w400),
                                      Text(
                                          "Table : ${e.tableCleared ? "  Cleared  " : "Occupied"}",
                                          style: Styles.poppins16w400),
                                      CustomButton(
                                        buttonText: "   View  ",
                                        onTap: () {
                                          Get.to(ViewOrder(order: e,));
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              );
        // Column(
        //   children: [

        //     ),
        //   ],
        // );
      }),
    );
  }
}
