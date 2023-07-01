import 'dart:io';

import 'package:admin/common/app_styles_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

ItemAlertDailog({required context}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: BeveledRectangleBorder(borderRadius: Styles.myradius2),
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
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
                  Expanded(
                      child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Item name : ",
                                style: Styles.poppins14,
                              ),
                              Text(
                                "Pav Bhaji",
                                style: Styles.poppins14.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              Text(
                                "Rate : ",
                                style: Styles.poppins14,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    enabled: false,
                                    // controller: serialNumberController,
                                    // initialValue: "100",
                                    keyboardType: Platform.isIOS
                                        ? const TextInputType.numberWithOptions(
                                            signed: true)
                                        : TextInputType.number,

                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          borderSide: const BorderSide(
                                              color: Colors.white)),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 10),
                                      //errorBorder: const InputBorder(),

                                      errorStyle: Styles.poppins16w400
                                          .copyWith(color: Colors.red),
                                      labelText: '100',
                                      labelStyle: Styles.poppins16w400,
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style: const TextStyle(fontSize: 16.0),
                                    // onChanged: (v){

                                    // },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Item Quantanity : ",
                                style: Styles.poppins14,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    // controller: serialNumberController,
                                    //initialValue: serialNumber.toString(),
                                    keyboardType: Platform.isIOS
                                        ? const TextInputType.numberWithOptions(
                                            signed: true)
                                        : TextInputType.number,

                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 3, horizontal: 10),
                                      //errorBorder: const InputBorder(),

                                      errorStyle: Styles.poppins16w400
                                          .copyWith(color: Colors.red),
                                      labelText: 'Enter Quantanity',
                                      labelStyle: Styles.poppins16w400,
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style: const TextStyle(fontSize: 16.0),
                                    // onChanged: (v){

                                    // },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "KG",
                                  style:
                                      Styles.poppins14.copyWith(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
                  const Divider(color: Colors.grey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Item Price : ",
                        style: Styles.poppins14,
                      ),
                      Text(
                        "100",
                        style: Styles.poppins14
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Styles.primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 15,
                            ),
                            child: Text("Add item to order",
                                style: Styles.poppins14
                                    .copyWith(color: Colors.white)),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
