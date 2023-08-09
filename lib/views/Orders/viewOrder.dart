import 'package:admin/common/app_styles_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../Models/Order.dart';

class ViewOrder extends StatefulWidget {
  Order order;
  ViewOrder({Key? key, required this.order}) : super(key: key);

  @override
  _ViewOrderState createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Order Id  : ${widget.order.orderId}",
          style: Styles.poppins16w400,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RichText(
                text: TextSpan(
                  //   style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: "Date : ",
                      style: Styles.poppins14,
                    ),
                    TextSpan(
                      text: widget.order.date,
                      style: Styles.poppins16w400,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  //   style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: "Time : ",
                      style: Styles.poppins14,
                    ),
                    TextSpan(
                      text: widget.order.time,
                      style: Styles.poppins16w400,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  //   style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: "Table ID : ",
                      style: Styles.poppins14,
                    ),
                    TextSpan(
                      text: widget.order.tableID,
                      style: Styles.poppins16w400,
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  //   style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: "Total: ",
                      style: Styles.poppins14,
                    ),
                    TextSpan(
                      text: widget.order.totalprice.toString(),
                      style: Styles.poppins16w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
            itemCount: widget.order.kots?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: Styles.myShadow,
                      borderRadius: Styles.myradius),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RichText(
                            text: TextSpan(
                              //   style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: "KOT Id : ",
                                  style: Styles.poppins14,
                                ),
                                TextSpan(
                                  text: "${widget.order.kots![index].KOTNo}",
                                  style: Styles.poppins16w400,
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              //   style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: "Kot Cost : ",
                                  style: Styles.poppins14,
                                ),
                                TextSpan(
                                  text: widget.order.kots![index].totalprice
                                      .toString(),
                                  style: Styles.poppins16w400,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Color.fromARGB(255, 178, 178, 178),
                      ),
                      Row(
                        children: [
                          const Gap(5),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Item Name",
                              style: Styles.poppins14w400,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Qty",
                              style: Styles.poppins14w400,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Price",
                              style: Styles.poppins14w400,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Color.fromARGB(255, 178, 178, 178),
                      ),
                      Column(
                        children: widget.order.kots![index].kotItems!
                            .map((e) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3),
                                  child: Row(
                                    children: [
                                      const Gap(5),
                                      Text(
                                        "${widget.order.kots![index].kotItems!.indexOf(e) + 1}. ",
                                        style: Styles.poppins14w400,
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          e.item!.itemname.toString(),
                                          style: Styles.poppins14w400,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          e.quantity.toString(),
                                          style: Styles.poppins14w400,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Rs.${e.price}",
                                          style: Styles.poppins14w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
