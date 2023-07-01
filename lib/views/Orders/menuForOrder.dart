import 'package:flutter/material.dart';

import '../../common/app_styles_colors.dart';
import 'itemAlertDailog.dart';

class MenuForOrder extends StatefulWidget {
  const MenuForOrder({ Key? key }) : super(key: key);

  @override
  _MenuForOrderState createState() => _MenuForOrderState();
}

class _MenuForOrderState extends State<MenuForOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  // onChanged: _filterItems,
                                  decoration: InputDecoration(
                                    //errorBorder: const InputBorder(),

                                    errorStyle: Styles.poppins16w400
                                        .copyWith(color: Colors.red),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Sno.",
                                          style: Styles.poppins16w400,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        //color: Colors.amber,
                                        alignment: Alignment.centerLeft,

                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
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
                                          "RATE",
                                          style: Styles.poppins16w400,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Qtx",
                                          style: Styles.poppins16w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: Styles.myShadow,
                                              borderRadius: Styles.myradius2),
                                          height: 30,
                                          child: InkWell(
                                            onTap: () {
                                              ItemAlertDailog(context: context);
                                            },
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "$index.",
                                                      style:
                                                          Styles.poppins16w400,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: Container(
                                                    //color: Colors.amber,
                                                    alignment:
                                                        Alignment.centerLeft,

                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: Text(
                                                        "item",
                                                        style: Styles
                                                            .poppins16w400,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "RATE",
                                                      style:
                                                          Styles.poppins16w400,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Qtx",
                                                      style:
                                                          Styles.poppins16w400,
                                                    ),
                                                  ),
                                                ),
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
  }
}