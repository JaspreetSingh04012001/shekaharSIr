import 'package:admin/common/app_styles_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../Services/Storage/outletMenu.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController serialNumberController = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController rate = TextEditingController();
  TextEditingController qtx = TextEditingController();
  TextEditingController fg = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
    fg.text = "F";

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
                    TextFormField(
                      controller: serialNumberController,
                      //initialValue: serialNumber.toString(),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        //errorBorder: const InputBorder(),

                        errorStyle:
                            Styles.poppins16w400.copyWith(color: Colors.red),
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
                    TextFormField(
                      controller: rate,
                      decoration: InputDecoration(
                        labelText: 'Rate',
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
                    const SizedBox(height: 16.0),
                    TextFormField(
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
                      //  keyboardType: TextInputType.number,
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
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: fg,
                      //  controller: TextEditingController,
                      //initialValue: "F",
                      decoration: InputDecoration(
                        labelText: 'FG',
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
                      // keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'I dont\' know';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        //  _menuItem.price = double.parse(value!);
                      },
                    ),
                    const Gap(25),
                    Text(
                      "Please select type of item.",
                      style: Styles.poppins16w400,
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              indexSelected = 0;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: Styles.myradius,
                                boxShadow: Styles.myShadow,
                                color: indexSelected == 0
                                    ? Colors.green
                                    : Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                types[0],
                                style: Styles.poppins16w400.copyWith(
                                  color: indexSelected != 0
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        InkWell(
                          onTap: () {
                            setState(() {
                              indexSelected = 1;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: Styles.myradius,
                                boxShadow: Styles.myShadow,
                                color: indexSelected == 1
                                    ? Colors.red
                                    : Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                types[1],
                                style: Styles.poppins16w400.copyWith(
                                  color: indexSelected != 1
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        InkWell(
                          onTap: () {
                            setState(() {
                              indexSelected = 2;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: Styles.myradius,
                                boxShadow: Styles.myShadow,
                                color: indexSelected == 2
                                    ? Colors.yellow
                                    : Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                types[2],
                                style: Styles.poppins16w400
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(25),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print(
                              "$indexSelected ${serialNumberController.text} ${name.text} ${rate.text} ${qtx.text} ${fg.text}");

                          // TODO: Save the menu item to your data source
                          // e.g., call a function to add it to a database or list
                          // SName : 11 item : Pav bhaji RATE : 10 Qtx : -17 FG : F
                          Stroge().addItemMenu(item: {
                            "SName": int.parse(serialNumberController.text),
                            "item": name.text,
                            "RATE": int.parse(rate.text),
                            "Qtx": qtx.text.isEmpty ? 0 : int.parse(qtx.text),
                            "FG": fg.text,
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
                              "FG": fg.text,
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Styles.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
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
