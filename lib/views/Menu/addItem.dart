import 'package:admin/Models/itemsVariation.dart';
import 'package:admin/common/app_styles_colors.dart';
import 'package:admin/common/reusable%20widgets/designedTextField.dart';
import 'package:admin/common/reusable%20widgets/myDropdown.dart';
import 'package:admin/reuseable%20Widgets/animated_dialog.dart';
import 'package:admin/reuseable%20Widgets/customButton.dart';
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
  String? selectedType;
  final List<String> foodTypes = [
    'Veg',
    'Non-Veg',
    'Egg Made',
  ];
  TextEditingController serialNumberController = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController qtx = TextEditingController();
  TextEditingController taxGst = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController unit = TextEditingController();
  TextEditingController altName = TextEditingController();
  
  bool isFinishedGood = false;
  bool isDiscountAble = false;
  bool isTaxGst = false;
  bool isRateDeciaml = false;
  bool isInclusiveExtra = false; //Inclusive/extra (for tax)
  bool isAltName = false; //Inclusive/extra (for tax)
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
  Map metricSystem = {
    0: {'val': false, 'sys': 'PCS'},
    1: {'val': false, 'sys': 'GMS'},
    2: {'val': false, 'sys': 'KG'},
    3: {'val': false, 'sys': 'ML'},
    4: {'val': false, 'sys': 'LTR'},
  };
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
          // serialNumberController.text = serialNumber.toString();
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
                          child: DesignedTextField(
                            controller: serialNumberController,
                            labelText: 'Item id',
                            validate: (value) {
                              if (value!.isEmpty ||
                                  serialNumbers.contains(int.parse(value)) ||
                                  serialNumbers.contains(value)) {
                                return 'Please enter different Serial Number';
                              }
                              return null;
                            },
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          flex: 1,
                          child: MyDropdown(
                            labelText: 'Select Department',
                            list: departements,
                            selectedValue: selectedValue,
                            onChanged: (value) {
                              //print(value);
                              setState(() {
                                selectedValue = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    DesignedTextField(
                      controller: name,
                      labelText: 'Item name',
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Item Name';
                        }
                        return null;
                      },

                      // _menuItem.description = value!;
                    ),

                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: MyDropdown(
                            list: catrgories,
                            selectedValue: selectedCategory,
                            onChanged: (value) {
                              //print(value);
                              setState(() {
                                selectedCategory = value;
                              });
                            },
                            labelText: 'Select Category',
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          flex: 1,
                          child: MyDropdown(
                            list: types,
                            selectedValue: selectedType,
                            onChanged: (value) {
                              //print(value);
                              setState(() {
                                selectedType = value;
                              });
                            },
                            labelText: 'Select Type',
                          ),
                        ),
                      ],
                    ),

                    const Gap(15),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: DesignedTextField(
                            labelText: 'Rate',
                            controller: rate,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter the price';
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                  activeColor: const Color.fromARGB(255, 7, 82,
                                      9), // Customize the checkbox's color when checked
                                  checkColor: Colors
                                      .white, // Customize the check icon's color
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    // Customize the checkbox's color when unchecked
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return const Color.fromARGB(255, 7, 82,
                                          9); // Make it semi-transparent when unchecked
                                    }
                                    return Colors.black;
                                  }),
                                  value: isRateDeciaml,
                                  onChanged: (v) {
                                    setState(() {
                                      isRateDeciaml = !isRateDeciaml;
                                    });
                                  }),
                              // const Gap(5),
                              Text(
                                "Decimal",
                                style: Styles.poppins14,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      "Please  enter UNIT for this item .",
                     
                      style: Styles.poppins14,
                    ),
                    const Gap(5),
                    DesignedTextField(
                      controller: unit,
                      labelText: 'Please enter unit  (for eg. KG,gms,litre)',
                    ),
                    const Gap(15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            Text(
                              "Finished good",
                              style: Styles.poppins14,
                            ),
                            const Gap(5),
                            if (isFinishedGood)
                              Expanded(
                                  flex: 1,
                                  child: DesignedTextField(
                                    labelText: 'Quantity',
                                    controller: qtx,
                                    keyboardType: TextInputType.number,
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter the Quantity';
                                      }
                                      return null;
                                    },
                                  )),
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
                            ),
                            const Gap(5),
                            if (isDiscountAble)
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DesignedTextField(
                                    controller: discount,
                                    labelText: 'Max Discount (%)',
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
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
                                value: isTaxGst,
                                onChanged: (v) {
                                  setState(() {
                                    isTaxGst = !isTaxGst;
                                  });
                                }),
                            // const Gap(5),
                            Text(
                              "Tax/GST",
                              style: Styles.poppins14,
                            ),
                            const Gap(5),
                            if (isTaxGst)
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DesignedTextField(
                                    controller: taxGst,
                                    labelText: 'GST Tax percentge (%)',
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              )
                          ],
                        ),
                        if (isTaxGst)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Is that tax ?",
                                style: Styles.poppins14,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
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
                                      fillColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                        // Customize the checkbox's color when unchecked
                                        if (states
                                            .contains(MaterialState.selected)) {
                                          return Styles
                                              .primaryColor; // Make it semi-transparent when unchecked
                                        }
                                        return Colors.black;
                                      }),
                                      value: isInclusiveExtra,
                                      onChanged: (v) {
                                        setState(() {
                                          isInclusiveExtra = !isInclusiveExtra;
                                        });
                                      }),
                                  // const Gap(5),
                                  Text(
                                    "Exclusive",
                                    style: Styles.poppins14,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
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
                                      fillColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                        // Customize the checkbox's color when unchecked
                                        if (states
                                            .contains(MaterialState.selected)) {
                                          return Styles
                                              .primaryColor; // Make it semi-transparent when unchecked
                                        }
                                        return Colors.black;
                                      }),
                                      value: isInclusiveExtra,
                                      onChanged: (v) {
                                        setState(() {
                                          isInclusiveExtra = !isInclusiveExtra;
                                        });
                                      }),
                                  // const Gap(5),
                                  Text(
                                    "Inclusive",
                                    style: Styles.poppins14,
                                  ),
                                ],
                              ),
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
                                value: isAltName,
                                onChanged: (v) {
                                  setState(() {
                                    isAltName = !isAltName;
                                  });
                                }),
                            // const Gap(5),
                            Text(
                              "Alternate Name ",
                              style: Styles.poppins14,
                            ),
                            const Gap(5),
                            if (isAltName)
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DesignedTextField(
                                    controller: altName,
                                    labelText: 'Enter Alternate Name',
                                    //  keyboardType: TextInputType.number,
                                  ),
                                ),
                              )
                          ],
                        ),
                      ],
                    ),
                    const Gap(15),

                    InkWell(
                      onTap: () {
                        showAnimatedDialog(
                            barrierDismissible: true,
                            context: context,
                            animationType:
                                DialogTransitionType.slideFromBottomFade,
                            builder: (context) {
                              TextEditingController varname =
                                  TextEditingController();
                              TextEditingController varrate =
                                  TextEditingController();

                              return AlertDialog(
                                content: Form(
                                  key: _variationformKey,
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Enter variation Details",
                                              style: Styles.poppins14,
                                            ),
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
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            controller: varname,
                                            //initialValue: serialNumber.toString(),

                                            decoration: InputDecoration(
                                              //errorBorder: const InputBorder(),

                                              errorStyle: Styles.poppins16w400
                                                  .copyWith(color: Colors.red),
                                              labelText: 'Variation name',
                                              labelStyle: Styles.poppins16w400,
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style:
                                                const TextStyle(fontSize: 16.0),
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller: varrate,
                                            //initialValue: serialNumber.toString(),

                                            decoration: InputDecoration(
                                              //errorBorder: const InputBorder(),

                                              errorStyle: Styles.poppins16w400
                                                  .copyWith(color: Colors.red),
                                              labelText: 'Rate',
                                              labelStyle: Styles.poppins16w400,
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style:
                                                const TextStyle(fontSize: 16.0),
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
                                                _formKey.currentState!.save();
                                                Variations.add(ItemVariation(
                                                  variaonName: varname.text,
                                                  rate: double.parse(
                                                      varrate.text),
                                                ));
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
                          color: const Color.fromARGB(255, 181, 187, 255),
                          borderRadius: Styles.myradius2,

                          //boxShadow: Styles.myShadow
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 17),
                          child: Text(
                            "+ Add Variations",
                            style: Styles.poppins14.copyWith(fontSize: 15),
                          ),
                        ),
                      ),
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
