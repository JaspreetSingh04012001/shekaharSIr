import 'package:admin/common/app_styles_colors.dart';
import 'package:flutter/material.dart';

class ManagerOrders extends StatelessWidget {
  const ManagerOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Recent Orders",style: S,),
      // ),

      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: Styles.myradius2,
                boxShadow: Styles.myShadow),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Order Id : 66776",
                  style: Styles.poppins16w400,
                ),
                // Text(
                //   "Customer Nmae : jaspreet singh",
                //   style: Styles.poppins16w400,
                // ),
                Text(
                  "11-07-2023 09 : 30 AM",
                  style: Styles.poppins16w400,
                ),
                Text(
                  "Table no. : 3",
                  style: Styles.poppins16w400,
                ),
                Text("Total : 1", style: Styles.poppins16w400),
                Text("Payment Status", style: Styles.poppins16w400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
