import 'package:admin/common/app_styles_colors.dart';
import 'package:admin/common/reusable%20widgets/alertbackbutton.dart';
import 'package:admin/common/reusable%20widgets/rightBoldText.dart';
import 'package:admin/controllers/storageController.dart';
import 'package:admin/reuseable%20Widgets/animated_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ItemModifications extends StatelessWidget {
  const ItemModifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List fuck(String timeintext) {
      var now = DateTime.parse(timeintext);
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final DateFormat timeformatter = DateFormat('Hm');
      final String date = formatter.format(now);
      final String time = timeformatter.format(now);
      return [date, time];
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Item Modifeid on Dates")),
      body: GetBuilder<StorageController>(builder: (storageController) {
        Map<dynamic, dynamic>? data = storageController.getItemModifications();
        List itemCodes = data?.keys.toList() ?? [];

        return ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: Styles.myradius2,
                      boxShadow: Styles.myShadow),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Item Id :${itemCodes[index]}",
                        style: Styles.poppins16w400,
                      ),
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                              data?[itemCodes[index]].length, (index1) {
                            Map tempdata = data?[itemCodes[index]][index1];
                            List keyss = tempdata.keys.toList();

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                    "${tempdata[keyss[0]]["itemname"]}\n changed on ${fuck(keyss[0])[0]} ${fuck(keyss[0])[1]}",
                                    style: Styles.poppins14,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      showAnimatedDialog(
                                          barrierDismissible: true,
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Alertbackbutton(),
                                                  RightBoldText(
                                                      title: "Name",
                                                      val: tempdata[keyss[0]]
                                                          ["itemname"]),
                                                  if (tempdata[keyss[0]]
                                                          ["shortName"] !=
                                                      null)
                                                    RightBoldText(
                                                        title: "Short Name",
                                                        val: tempdata[keyss[0]]
                                                            ["shortName"]),
                                                  RightBoldText(
                                                      title: "Rate",
                                                      val: "Rs." +
                                                          tempdata[keyss[0]]
                                                              ["rate"]),
                                                  RightBoldText(
                                                      title: "Department",
                                                      val: tempdata[keyss[0]]
                                                          ["department"]),
                                                  RightBoldText(
                                                      title: "Category",
                                                      val: tempdata[keyss[0]]
                                                          ["category"]),
                                                  RightBoldText(
                                                      title: "Type",
                                                      val: tempdata[keyss[0]]
                                                          ["type"]),
                                                  if (tempdata[keyss[0]]
                                                          ["tax"] !=
                                                      null)
                                                    RightBoldText(
                                                        title: "Tax",
                                                        val:
                                                            "${tempdata[keyss[0]]["tax"]}%"),
                                                  if (tempdata[keyss[0]]
                                                          ["cess"] !=
                                                      null)
                                                    RightBoldText(
                                                        title: "cess",
                                                        val: tempdata[keyss[0]]
                                                                ["cess"] +
                                                            "%"),
                                                  if (tempdata[keyss[0]]
                                                          ["inclusive"] !=
                                                      null)
                                                    RightBoldText(
                                                        title: "inclusive",
                                                        val: tempdata[keyss[0]]
                                                                ["inclusive"]
                                                            ? "inclusive"
                                                            : "Exclusive"),
                                                  if (tempdata[keyss[0]][
                                                              "discountable"] !=
                                                          null &&
                                                      tempdata[keyss[0]]
                                                              ["discount"] !=
                                                          null)
                                                    RightBoldText(
                                                        title: "Discountable",
                                                        val: tempdata[keyss[0]]
                                                                ["discount"] +
                                                            "%"),
                                                  if (tempdata[keyss[0]][
                                                              "isFinishedGood"] !=
                                                          null &&
                                                      tempdata[keyss[0]]
                                                              ["qty"] !=
                                                          null)
                                                    RightBoldText(
                                                        title: "Quantity",
                                                        val: tempdata[keyss[0]]
                                                            ["qty"]),
                                                  if (tempdata[keyss[0]]
                                                          ["sellUom"] !=
                                                      null)
                                                    RightBoldText(
                                                        title: "Unit",
                                                        val: tempdata[keyss[0]]
                                                            ["sellUom"]),
                                                  if (tempdata[keyss[0]]
                                                          ["altName"] !=
                                                      null)
                                                    RightBoldText(
                                                        title: "Alternate Name",
                                                        val: tempdata[keyss[0]]
                                                            ["altName"]),
                                                  if (tempdata[keyss[0]]
                                                          ["variations"] !=
                                                      null)
                                                    Text(
                                                      "Variations :",
                                                      style: Styles
                                                          .poppins16w500
                                                          .copyWith(
                                                              color: Styles
                                                                  .primaryColor),
                                                    ),
                                                  if (tempdata[keyss[0]]
                                                          ["variations"] !=
                                                      null)
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: List.generate(
                                                          tempdata[keyss[0]]
                                                                  ["variations"]
                                                              .length,
                                                          (index) => RightBoldText(
                                                              title: tempdata[keyss[0]]
                                                                          ["variations"]
                                                                      [index][
                                                                  "variationName"],
                                                              val: "Rs." +
                                                                  tempdata[keyss[0]]
                                                                              ["variations"]
                                                                          [index]
                                                                      [
                                                                      "rate"])),
                                                    )
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                    icon: Icon(
                                      Icons.receipt_long_rounded,
                                      color: Styles.primaryColor,
                                    ))
                              ],
                            );
                          }))
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
