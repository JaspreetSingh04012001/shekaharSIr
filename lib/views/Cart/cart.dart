import 'package:admin/reuseable%20Widgets/customButton.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../common/app_styles_colors.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  String? selectedValue;
  final List<String> items = [
    'Ravi',
    'Jass',
    'Mohit',
  ];
  String? selectedValue2;
  List<String> items2 = List.generate(31, (index) => index.toString());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: Styles.myradius,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 224, 219, 219),
                  spreadRadius: 2,
                  blurRadius: 3,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(8),
              Text(
                "Table no.2",
                style: Styles.poppins16w400,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: Text(
                        "Select Steward :",
                        style: Styles.poppins14,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 215, 215),
                        borderRadius: Styles.myradius2,
                        //boxShadow: Styles.myShadow
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          alignment: Alignment.center,
                          isDense: true,
                          //  isExpanded: true,
                          hint: Text(
                            'Select name',
                            style: Styles.poppins14,
                            overflow: TextOverflow.ellipsis,
                          ),
                          items: items
                              .map((String item) => DropdownMenuItem<String>(
                                    alignment: Alignment.center,
                                    value: item,
                                    child: Text(item,
                                        style: Styles.poppins14.copyWith(
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            //print(value);
                            setState(() {
                              selectedValue = value;
                            });
                          },

                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 1000,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all(6),
                              thumbVisibility: MaterialStateProperty.all(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  verticalDirection: VerticalDirection.down,
                  alignment: WrapAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      child: Text(
                        "Number of People :",
                        style: Styles.poppins14,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 215, 215),
                        borderRadius: Styles.myradius2,
                        //boxShadow: Styles.myShadow
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          alignment: Alignment.center,
                          isDense: true,
                          //  isExpanded: true,
                          hint: Text(
                            'Select num',
                            style: Styles.poppins14,
                            overflow: TextOverflow.ellipsis,
                          ),
                          items: items2
                              .map((String item) => DropdownMenuItem<String>(
                                    alignment: Alignment.center,
                                    value: item,
                                    child: Text(item,
                                        style: Styles.poppins14.copyWith(
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ))
                              .toList(),
                          value: selectedValue2,
                          onChanged: (value) {
                            //print(value);
                            setState(() {
                              selectedValue2 = value;
                            });
                          },

                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 1000,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all(6),
                              thumbVisibility: MaterialStateProperty.all(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              // ElevatedButton(
              //     style: Styles.mybuttonStyle,
              //     onPressed: () {},
              //     child: const Row(
              //       children: [
              //         Text("Place Order"),
              //       ],
              //     )),
              CustomButton(
                // height: 30,
                //width: double.infinity,
                buttonText: "Place Order",
              )
            ],
          ),
        ),
      ),
    );
  }
}
