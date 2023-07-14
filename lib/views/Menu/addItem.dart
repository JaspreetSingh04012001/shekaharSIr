import 'package:admin/Models/itemsVariation.dart';
import 'package:admin/common/app_styles_colors.dart';
import 'package:admin/reuseable%20Widgets/animated_dialog.dart';
import 'package:admin/reuseable%20Widgets/customButton.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../Services/Storage/outletMenu.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String? selectedValue;
  List<ItemVariation> Variations = [];
  final List<String> departements = [
    'kitchen',
    'Bar',
  ];
  String? selectedCategory;
  final List<String> catrgories = [
    'Lunch',
    'Dinner',
    'Chinnese',
    'Tandoor',
    'Snacks',
  ];
  TextEditingController serialNumberController = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController qtx = TextEditingController();
  bool isFinishedGood = false;
  bool isDiscountAble = false;
  bool isVeg = false;
  bool isNonVeg = false;
  bool isEggMade = false;
  final _formKey = GlobalKey<FormState>();
  final _variationformKey = GlobalKey<FormState>();
  List items = [];
  int? indexSelected;
  List<String> types = ["Veg", "Non-Veg", "Egg-Made"];
  List tempItems = [];
  List<int> serialNumbers = [];
  // List tempserialNumbers = [];
  int serialNumber = 0;
  final obj = Stroge();

  assignSerialNumber() {
    bool serialNumberFound = false;
    int count = items.isEmpty ? 1 : items.length;

    while (!serialNumberFound) {
      if (serialNumbers.contains(count) ||
          serialNumbers.contains(count.toString())) {
        count++;
      } else {
        serialNumberFound = true;
        setState(() {
          serialNumber = count;
          serialNumberController.text = serialNumber.toString();
        });
      }
    }
  }

  getSerialNumber({int? num}) async {
    items.clear();
    serialNumbers.clear();

    var data = obj.box.read("OutletID");
    if (data is List) {
      items = data.toSet().toList();
      for (var element in items) {
        if (element["SName"] is int) {
          serialNumbers.add(element["SName"]);
        }
        if (element["SName"] is String) {
          serialNumbers.add(int.parse(element["SName"]));
        }
      }

      assignSerialNumber();
    }
  }

  @override
  void initState() {
    // fg.text = "F";

    getSerialNumber();
    // TODO: implement initState
    super.initState();
  }

  // final _menuItem = MenuItem(name: '', description: '', price: 0.0);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 2;
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Add Item in Menu",
          style: Styles.poppins18w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            controller: serialNumberController,
                            //initialValue: serialNumber.toString(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              //errorBorder: const InputBorder(),

                              errorStyle: Styles.poppins16w400
                                  .copyWith(color: Colors.red),
                              labelText: 'S.no',
                              labelStyle: Styles.poppins16w400,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: const TextStyle(fontSize: 16.0),
                            // onChanged: (v){

                            // },
                            validator: (value) {
                              if (value!.isEmpty ||
                                  serialNumbers.contains(int.parse(value)) ||
                                  serialNumbers.contains(value)) {
                                return 'Please enter different Serial Number';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              // _menuItem.name = value!;
                            },
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: Styles.myradius2,
                              //boxShadow: Styles.myShadow
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 5),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  alignment: Alignment.center,
                                  isDense: true,
                                  //  isExpanded: true,
                                  hint: Text(
                                    'Select Department',
                                    style: Styles.poppins14,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  items: departements
                                      .map((String item) =>
                                          DropdownMenuItem<String>(
                                            alignment: Alignment.center,
                                            value: item,
                                            child: Text(item,
                                                style:
                                                    Styles.poppins14.copyWith(
                                                  fontSize: 18,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                      thumbVisibility:
                                          MaterialStateProperty.all(true),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                    padding:
                                        EdgeInsets.only(left: 14, right: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        labelText: 'Item name',
                        errorStyle:
                            Styles.poppins16w400.copyWith(color: Colors.red),
                        labelStyle: Styles.poppins16w400,
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      style: const TextStyle(fontSize: 16.0),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Item Name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // _menuItem.description = value!;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            controller: rate,
                            decoration: InputDecoration(
                              labelText: 'Rate',
                              errorStyle: Styles.poppins16w400
                                  .copyWith(color: Colors.red),
                              labelStyle: Styles.poppins16w400,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: const TextStyle(fontSize: 16.0),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter the price';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              //  _menuItem.price = double.parse(value!);
                            },
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            // keyboardType: TextInputType.numberWithOptions(signed: true),
                            //   inputFormatters: [
                            //     FilteringTextInputFormatter.allow(
                            //         RegExp(r'^-?\d*\.?\d*$')),
                            //     TextInputFormatter.withFunction((oldValue, newValue) {
                            //       // Allow '-' symbol only at the beginning
                            //       if (newValue.text == '-' && oldValue.text != '-') {
                            //         return newValue.copyWith(text: '');
                            //       }
                            //       return newValue;
                            //     }),
                            //   ],

                            controller: qtx,
                            decoration: InputDecoration(
                              labelText: 'Qtx',
                              errorStyle: Styles.poppins16w400
                                  .copyWith(color: Colors.red),
                              labelStyle: Styles.poppins16w400,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: const TextStyle(fontSize: 16.0),
                            //  keyboardType: TextInputType.number,
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Please enter the Quantity';
                            //   }
                            //   return null;
                            // },
                            onSaved: (value) {
                              //  context.
                              //  _menuItem.price = double.parse(value!);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  // Customize the checkbox's color when unchecked
                                  if (states.contains(MaterialState.selected)) {
                                    return Styles
                                        .primaryColor; // Make it semi-transparent when unchecked
                                  }
                                  return Colors.black;
                                }),
                                value: isFinishedGood,
                                onChanged: (v) {
                                  setState(() {
                                    isFinishedGood = !isFinishedGood;
                                  });
                                }),
                            // const Gap(5),
                            Text(
                              "Finished good",
                              style: Styles.poppins14,
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  // Customize the checkbox's color when unchecked
                                  if (states.contains(MaterialState.selected)) {
                                    return Styles
                                        .primaryColor; // Make it semi-transparent when unchecked
                                  }
                                  return Colors.black;
                                }),
                                value: isDiscountAble,
                                onChanged: (v) {
                                  setState(() {
                                    isDiscountAble = !isDiscountAble;
                                  });
                                }),
                            // const Gap(5),
                            Text(
                              "Discount Able",
                              style: Styles.poppins14,
                            )
                          ],
                        ),
                        //  MyCheckBox(val: isFinishedGood, text: "Finished good"),
                        // MyCheckBox(val: isDiscountAble, text: "Discount Able"),
                        isDiscountAble
                            ? Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Max Discount (%)',
                                      errorStyle: Styles.poppins16w400
                                          .copyWith(color: Colors.red),
                                      labelStyle: Styles.poppins16w400,
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style: const TextStyle(fontSize: 16.0),
                                    keyboardType: TextInputType.number,
                                    // validator: (value) {
                                    //   if (value!.isEmpty) {
                                    //     return 'Please enter the Quantity';
                                    //   }
                                    //   return null;
                                    // },
                                    onSaved: (value) {
                                      //  _menuItem.price = double.parse(value!);
                                    },
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                    const Gap(15),
                    Text(
                      "Please select type of item.",
                      style: Styles.poppins16w400,
                    ),
                    const Gap(8),
                    Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                                    .green, // Customize the checkbox's color when checked
                                checkColor: Colors
                                    .white, // Customize the check icon's color
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  // Customize the checkbox's color when unchecked
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors
                                        .green; // Make it semi-transparent when unchecked
                                  }
                                  return Colors.black;
                                }),
                                value: isVeg,
                                onChanged: (v) {
                                  setState(() {
                                    isVeg = !isVeg;
                                    if (isVeg) {
                                      isEggMade = false;
                                      isNonVeg = false;
                                    }
                                  });
                                }),
                            // const Gap(5),
                            Text(
                              "Veg",
                              style: Styles.poppins14,
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                                    .green, // Customize the checkbox's color when checked
                                checkColor: Colors
                                    .white, // Customize the check icon's color
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  // Customize the checkbox's color when unchecked
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors
                                        .red; // Make it semi-transparent when unchecked
                                  }
                                  return Colors.black;
                                }),
                                value: isNonVeg,
                                onChanged: (v) {
                                  setState(() {
                                    isNonVeg = !isNonVeg;
                                    if (isNonVeg) {
                                      isEggMade = false;
                                      isVeg = false;
                                    }
                                  });
                                }),
                            // const Gap(5),
                            Text(
                              "Non-Veg",
                              style: Styles.poppins14,
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                                    .green, // Customize the checkbox's color when checked
                                checkColor: Colors
                                    .white, // Customize the check icon's color
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  // Customize the checkbox's color when unchecked
                                  if (states.contains(MaterialState.selected)) {
                                    return Styles
                                        .yellowColor; // Make it semi-transparent when unchecked
                                  }
                                  return Colors.black;
                                }),
                                value: isEggMade,
                                onChanged: (v) {
                                  setState(() {
                                    isEggMade = !isEggMade;
                                    if (isEggMade) {
                                      isVeg = false;
                                      isNonVeg = false;
                                    }
                                  });
                                }),
                            // const Gap(5),
                            Text(
                              "Egg Made",
                              style: Styles.poppins14,
                            )
                          ],
                        ),
                      ],
                    ),
                    const Gap(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: Styles.myradius2,
                              //boxShadow: Styles.myShadow
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 5),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  alignment: Alignment.center,
                                  isDense: true,
                                  //  isExpanded: true,
                                  hint: Text(
                                    'Select Category',
                                    style: Styles.poppins14,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  items: catrgories
                                      .map((String item) =>
                                          DropdownMenuItem<String>(
                                            alignment: Alignment.center,
                                            value: item,
                                            child: Text(item,
                                                style:
                                                    Styles.poppins14.copyWith(
                                                  fontSize: 18,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                )),
                                          ))
                                      .toList(),
                                  value: selectedCategory,
                                  onChanged: (value) {
                                    //print(value);
                                    setState(() {
                                      selectedCategory = value;
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
                                      thumbVisibility:
                                          MaterialStateProperty.all(true),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                    padding:
                                        EdgeInsets.only(left: 14, right: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                showAnimatedDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    animationType: DialogTransitionType
                                        .slideFromBottomFade,
                                    builder: (context) {
                                      TextEditingController varname =
                                          TextEditingController();
                                      TextEditingController varrate =
                                          TextEditingController();
                                      TextEditingController varqtx =
                                          TextEditingController();
                                      return AlertDialog(
                                        content: Form(
                                          key: _variationformKey,
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Enter variation Details",
                                                      style: Styles.poppins14,
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: Icon(
                                                          Icons.cancel,
                                                          color: Styles
                                                              .primaryColor,
                                                        ))
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    controller: varname,
                                                    //initialValue: serialNumber.toString(),

                                                    decoration: InputDecoration(
                                                      //errorBorder: const InputBorder(),

                                                      errorStyle: Styles
                                                          .poppins16w400
                                                          .copyWith(
                                                              color:
                                                                  Colors.red),
                                                      labelText:
                                                          'Variation name',
                                                      labelStyle:
                                                          Styles.poppins16w400,
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                    style: const TextStyle(
                                                        fontSize: 16.0),
                                                    // onChanged: (v){

                                                    // },
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Please enter variant name';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      // _menuItem.name = value!;
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: varqtx,
                                                    //initialValue: serialNumber.toString(),

                                                    decoration: InputDecoration(
                                                      //errorBorder: const InputBorder(),

                                                      errorStyle: Styles
                                                          .poppins16w400
                                                          .copyWith(
                                                              color:
                                                                  Colors.red),
                                                      labelText: 'Qty',
                                                      labelStyle:
                                                          Styles.poppins16w400,
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                    style: const TextStyle(
                                                        fontSize: 16.0),
                                                    // onChanged: (v){

                                                    // },
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Please enter Quantity';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      // _menuItem.name = value!;
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller: varrate,
                                                    //initialValue: serialNumber.toString(),

                                                    decoration: InputDecoration(
                                                      //errorBorder: const InputBorder(),

                                                      errorStyle: Styles
                                                          .poppins16w400
                                                          .copyWith(
                                                              color:
                                                                  Colors.red),
                                                      labelText: 'Rate',
                                                      labelStyle:
                                                          Styles.poppins16w400,
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                    style: const TextStyle(
                                                        fontSize: 16.0),
                                                    // onChanged: (v){

                                                    // },
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        return 'Please enter price';
                                                      }
                                                      return null;
                                                    },
                                                    onSaved: (value) {
                                                      // _menuItem.name = value!;
                                                    },
                                                  ),
                                                ),
                                                CustomButton(
                                                    onTap: () {
                                                      // _variationformKey.currentState.validate();
                                                      if (_variationformKey
                                                          .currentState!
                                                          .validate()) {
                                                        _formKey.currentState!
                                                            .save();
                                                        Variations.add(
                                                            ItemVariation(
                                                                variaonName:
                                                                    varname
                                                                        .text,
                                                                rate: double
                                                                    .parse(varrate
                                                                        .text),
                                                                qtx: double
                                                                    .parse(varqtx
                                                                        .text)));
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                    height: 60,
                                                    buttonText: "Save")
                                              ]),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 181, 187, 255),
                                  borderRadius: Styles.myradius2,

                                  //boxShadow: Styles.myShadow
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 17),
                                  child: Text(
                                    "+ Add Variations",
                                    style:
                                        Styles.poppins14.copyWith(fontSize: 15),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                    if (Variations.isNotEmpty)
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Variations :",
                              style: Styles.poppins16w400,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: Styles.myradius2),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "Name",
                                    style: Styles.poppins16w400,
                                  ),
                                  const Gap(5),
                                  Text(
                                    "Qty",
                                    style: Styles.poppins16w400,
                                  ),
                                  const Gap(5),
                                  Text(
                                    "Rate",
                                    style: Styles.poppins16w400,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        children: List.generate(
                            Variations.length,
                            (index) => Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: Styles.myradius2),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${Variations[index].variaonName}",
                                        style: Styles.poppins16w400,
                                      ),
                                      const Gap(5),
                                      Text(
                                        "${Variations[index].qtx}",
                                        style: Styles.poppins16w400,
                                      ),
                                      const Gap(5),
                                      Text(
                                        "${Variations[index].rate}",
                                        style: Styles.poppins16w400,
                                      ),
                                      const Gap(5),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              Variations.removeAt(index);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Styles.primaryColor,
                                          ))
                                    ],
                                  ),
                                )),
                      ),
                    ),
                    //Variations.map((e) => null)
                    const Gap(20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // print(
                          //     "$indexSelected ${serialNumberController.text} ${name.text} ${rate.text} ${qtx.text} ${fg.text}");

                          // TODO: Save the menu item to your data source
                          // e.g., call a function to add it to a database or list
                          // SName : 11 item : Pav bhaji RATE : 10 Qtx : -17 FG : F
                          Stroge().addItemMenu(item: {
                            "SName": int.parse(serialNumberController.text),
                            "item": name.text,
                            "RATE": int.parse(rate.text),
                            "Qtx": qtx.text.isEmpty ? 0 : int.parse(qtx.text),
                            "FG": isFinishedGood,
                            "type": indexSelected == null
                                ? ""
                                : types[indexSelected ?? 0]
                          });
                          setState(() {
                            tempItems.add({
                              "SName": int.parse(serialNumberController.text),
                              "item": name.text,
                              "RATE": int.parse(rate.text),
                              "Qtx": qtx.text.isEmpty ? 0 : int.parse(qtx.text),
                              "FG": isFinishedGood,
                              "type": indexSelected == null
                                  ? ""
                                  : types[indexSelected ?? 0]
                            });
                            indexSelected = null;
                          });
                          serialNumbers
                              .add(int.parse(serialNumberController.text));
                          serialNumberController.clear();
                          name.clear();
                          rate.clear();
                          qtx.clear();

                          //serialNumber = 0;
                          getSerialNumber();
                          //g.clear();
                          //fg.text = "F";
                        }
                      },
                      style: Styles.mybuttonStyle,
                      child: Text(
                        'Add Item',
                        style:
                            Styles.poppins16w500.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height * 2,
                child: ListView.builder(
                    itemCount: tempItems.length,
                    itemBuilder: (context, index) {
                      //["Veg", "Non-Veg", "Egg-Made"];
                      Color color = Colors.white;
                      Color textColor = Colors.white;
                      if (tempItems[index]["type"] == "Veg") {
                        color = const Color.fromARGB(255, 58, 139, 60);
                      }
                      if (tempItems[index]["type"] == "Non-Veg") {
                        color = Colors.red;
                      }
                      if (tempItems[index]["type"] == "Egg-Made") {
                        color = Colors.yellow;
                        textColor = Colors.black;
                      }
                      if (tempItems[index]["type"] == "") {
                        //color = Colors.yellow;
                        textColor = Colors.black;
                      }
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 1),
                        child: Container(
                          height: 30,
                          width: width,
                          color: color,
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: width * 0.1,
                                child: Text(
                                  "${tempItems[index]["SName"]}",
                                  style: Styles.poppins12
                                      .copyWith(color: textColor),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: width * 0.45,
                                child: Text(
                                  "${tempItems[index]["item"]}",
                                  style: Styles.poppins12
                                      .copyWith(color: textColor),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: width * 0.15,
                                child: Text(
                                  "${tempItems[index]["RATE"]}",
                                  style: Styles.poppins12
                                      .copyWith(color: textColor),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: width * 0.2,
                                child: Text(
                                  "${tempItems[index]["Qtx"]}",
                                  style: Styles.poppins12
                                      .copyWith(color: textColor),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: width * 0.1,
                                child: Text(
                                  "${tempItems[index]["FG"]}",
                                  style: Styles.poppins12
                                      .copyWith(color: textColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
