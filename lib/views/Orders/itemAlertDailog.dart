import 'package:admin/Models/item.dart';
import 'package:admin/controllers/cartController.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';

import '../../Models/kot.dart';
import '../../common/app_styles_colors.dart';
import '../../reuseable Widgets/customButton.dart';

class ItemAlertDailog extends StatefulWidget {
  Item item;
  var quantity;
  bool isKotItem;
  int? indexofKotItem;
  KotItem? kotItem;
  ItemAlertDailog(
      {Key? key,
      required this.item,
      this.quantity = 1,
      this.isKotItem = false,
      this.kotItem,
      this.indexofKotItem})
      : super(key: key);

  @override
  State<ItemAlertDailog> createState() => _ItemAlertDailogState();
}

class _ItemAlertDailogState extends State<ItemAlertDailog> {
  bool variationChanged = false;
  int? variationIndexInKot;
  List<bool>? variationsSelections;
  TextEditingController quantityText = TextEditingController();
  int decimalDigits = 0;
  var price;
  String rate = "0";
  void setPrice() {
    setState(() {
      if (decimalDigits == 2) {
        price = double.parse(quantityText.text) * double.parse(rate);
        price = "$price";

        price = double.parse(price);
        price = double.parse(price.toStringAsFixed(2));
      } else {
        price = double.parse(quantityText.text) * double.parse(rate);
      }
    });
  }

  @override
  void initState() {
    if (widget.isKotItem) {
      rate = widget.kotItem!.item?.rate.toString() ?? '';
      price = widget.kotItem!.price;
      if (widget.item.variations != null) {
        variationsSelections =
            List.filled(widget.item.variations!.length, false);

        if (widget.kotItem?.selectedVariation != null) {
          widget.item.variations!.asMap().forEach((index, element) {
            if (widget.kotItem?.selectedVariation?.variationName ==
                element.variationName) {
              variationIndexInKot = index;
              variationsSelections![index] = true;
            }
          });
          // variationsSelections![widget.item.variations!.indexOf(
          //     widget.kotItem!.selectedVariation as ItemVariation)] = true;
        }

        // variationsSelections![0] = true;
      }
      quantityText.text = widget.kotItem!.quantity;
      if (widget.kotItem!.item?.isRateDeciaml != null) {
        bool f = widget.item.isRateDeciaml as bool;

        decimalDigits = f ? 2 : 0;
      }
    } else {
      rate = widget.item.rate.toString();
      if (widget.item.variations != null) {
        variationsSelections =
            List.filled(widget.item.variations!.length, false);
        // variationsSelections![0] = true;
      }
      quantityText.text = widget.quantity.toString();
      price = widget.quantity * double.parse(widget.item.rate.toString());

      if (widget.item.isRateDeciaml != null) {
        bool f = widget.item.isRateDeciaml as bool;
        setState(() {
          decimalDigits = f ? 2 : 0;
        });
      }
    }
    setState(() {});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
        Text(
          widget.item.itemname.toString(),
          //"Pav Bhaji",
          style: Styles.poppins14
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        if (widget.item.variations == null)
          Text(
            "Rs.${widget.item.rate} ${widget.item.sellUom ?? ''}",
            style: Styles.poppins14.copyWith(color: Colors.black),
          ),
        if (widget.item.variations != null)
          Column(
            children: widget.item.variations!
                .map((e1) => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            //alignment: Alignment.center,
                            // width: width * 0.45,
                            child: Text(
                              e1.variationName.toString(),
                              style: Styles.poppins14
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            // alignment: Alignment.center,
                            //width: width * 0.2,
                            child: Text(
                              "Rs.${e1.rate}",
                              style: Styles.poppins14
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
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
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              // Customize the checkbox's color when unchecked
                              if (states.contains(MaterialState.selected)) {
                                return Styles
                                    .primaryColor; // Make it semi-transparent when unchecked
                              }
                              return Colors.black;
                            }),
                            value: variationsSelections![
                                widget.item.variations!.indexOf(e1)],
                            onChanged: (v) {
                              int i = widget.item.variations!.indexOf(e1);

                              variationsSelections![i] =
                                  !variationsSelections![i];
                              for (int a = 0;
                                  a < variationsSelections!.length;
                                  a++) {
                                if (a != i) {
                                  variationsSelections![a] = false;
                                } else {
                                  if (variationsSelections![i]) {
                                    rate = widget.item.variations![i].rate
                                        .toString();
                                  } else {
                                    rate = widget.item.rate.toString();
                                  }
                                }
                              }
                              setPrice();
                            }),
                      ],
                    ))
                .toList(),
          ),
        const Gap(10),
        Text(
          "Item Quantanity : ",
          style: Styles.poppins14,
        ),
        const Gap(10),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: quantityText,
                inputFormatters: [
                  NumberTextInputFormatter(
                      allowNegative: false, decimalDigits: decimalDigits)
                ],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  //errorBorder: const InputBorder(),

                  errorStyle: Styles.poppins16w400.copyWith(color: Colors.red),
                  labelText: 'Enter Quantanity',
                  labelStyle: Styles.poppins16w400,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                style: const TextStyle(fontSize: 16.0),
                onChanged: (v) {
                  v = v.trim();
                  if (v != "") {
                    widget.quantity = double.parse(v);
                    setPrice();
                  } else {}
                },
              ),
            ),
            if (widget.item.sellUom != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  widget.item.sellUom.toString(),
                  style: Styles.poppins14,
                ),
              ),
          ],
        ),
        const Divider(color: Colors.grey),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Price : ",
              style: Styles.poppins14,
            ),
            Text(
              "$price",
              style: Styles.poppins14.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Divider(color: Colors.grey),
        GetBuilder<CartController>(builder: (cartController) {
          String selectedTableid = cartController.selectedTable!.id.toString();
          void kotNull() {
            final DateTime now = DateTime.now();
            final DateFormat formatter = DateFormat('yyyy-MM-dd');
            final DateFormat timeformatter = DateFormat('Hm');
            final String date = formatter.format(now);
            final String time = timeformatter.format(now);
            var id = cartController.assignKotId().toString();
            cartController.setcurrentKotOnTable(Kot.fromjson({
              "KOTNo": id,
              "kotItems": [
                {
                  'quantity': quantityText.text.toString(),
                  'item': widget.item.tojson(),
                  if (variationsSelections != null)
                    'selectedVariation': variationsSelections!.contains(true)
                        ? widget.item
                            .variations![variationsSelections!.indexOf(true)]
                            .tojson()
                        : null,
                  'price': price,
                }
              ],
              "Date": date,
              "Time": time,
              "TableID": cartController.selectedTable!.id.toString(),
              "totalprice": price,
            }));
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (variationsSelections != null)
                CustomButton(
                  buttonText: "Add as new Item",
                  onTap: () {
                    if (cartController.tableKot[selectedTableid] == null) {
                      kotNull();
                    } else {
                      if (cartController.tableKot[selectedTableid]?.kotItems !=
                          null) {
                        cartController.tableKot[selectedTableid]!.kotItems!
                            .add(KotItem.fromjson({
                          'quantity': quantityText.text.toString(),
                          'item': widget.item.tojson(),
                          if (variationsSelections != null)
                            'selectedVariation':
                                variationsSelections!.contains(true)
                                    ? widget
                                        .item
                                        .variations![
                                            variationsSelections!.indexOf(true)]
                                        .tojson()
                                    : null,
                          'price': price,
                        }));
                      } else {
                        quantityText.text = widget.kotItem!.quantity;
                      }
                    }

                    cartController.update();
                    Navigator.pop(context);
                  },
                ),
              CustomButton(
                buttonText:
                    widget.isKotItem ? "Update Current item" : "Add to Cart",
                onTap: () {
                  if (cartController.tableKot[selectedTableid] == null) {
                    kotNull();
                  } else {
                    widget.isKotItem
                        ? cartController.tableKot[selectedTableid]!
                                .kotItems![widget.indexofKotItem ?? 0] =
                            KotItem.fromjson({
                            'quantity': quantityText.text.toString(),
                            'item': widget.item.tojson(),
                            if (variationsSelections != null)
                              'selectedVariation': variationsSelections!
                                      .contains(true)
                                  ? widget
                                      .item
                                      .variations![
                                          variationsSelections!.indexOf(true)]
                                      .tojson()
                                  : null,
                            'price': price,
                          })
                        : cartController.tableKot[selectedTableid]!.kotItems!
                            .add(KotItem.fromjson({
                            'quantity': quantityText.text.toString(),
                            'item': widget.item.tojson(),
                            if (variationsSelections != null)
                              'selectedVariation': variationsSelections!
                                      .contains(true)
                                  ? widget
                                      .item
                                      .variations![
                                          variationsSelections!.indexOf(true)]
                                      .tojson()
                                  : null,
                            'price': price,
                          }));
                  }

                  // currentKotOnTable?.totalprice =
                  //     currentKotOnTable.totalprice + price;
                  // if (currentKotOnTable?.kotItems == null) {
                  //   currentKotOnTable?.kotItems = [KotItem.fromjson({})];
                  // } else {
                  //   currentKotOnTable!.kotItems!.add(KotItem.fromjson({
                  //     'quantity': quantityText.text.toString(),
                  //     'item': widget.item.tojson(),
                  //     if (variationsSelections != null)
                  //       'selectedVariation': variationsSelections!.contains(true)
                  //           ? widget.item
                  //               .variations![variationsSelections!.indexOf(true)]
                  //               .tojson()
                  //           : null,
                  //     'price': price,
                  //   }));
                  // }
                  // Get.find<CartController>().setcurrentKotOnTable(
                  //     Kot.fromjson(currentKotOnTable!.toJson()));
                  cartController.update();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        })
      ],
    );
  }
}
