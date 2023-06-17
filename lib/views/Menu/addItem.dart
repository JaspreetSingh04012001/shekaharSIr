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
  List serialNumbers = [];
  // List tempserialNumbers = [];
  int serialNumber = 0;
  final obj = Stroge();
  getSerialNumber({int? num}) async {
    items.clear();
    serialNumbers.clear();

    var data = obj.box.read("OutletID");
    if (data is List) {
      items = [...data];

      for (var element in items) {
        serialNumbers.add(element["SName"]);
      }
      setState(() {
        serialNumber = serialNumbers.isEmpty ? 0 : serialNumbers.length;
        serialNumberController.text = serialNumber.toString();
      });

      if (serialNumbers.contains(serialNumber)) {
        setState(() {
          serialNumber = serialNumbers.length + 1;
          //  tempserialNumbers.add(serialNumber);
          serialNumberController.text = serialNumber.toString();
        });
      }
      //serialNumbers.remove(serialNumber);
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
                            serialNumbers.contains(int.parse(value))) {
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
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the Quantity';
                        }
                        return null;
                      },
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
                    const Gap(20),
                    Text(
                      "Please select type of item.",
                      style: Styles.poppins16w400,
                    ),
                    const Gap(5),
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
                            decoration: BoxDecoration(
                                borderRadius: Styles.myradius,
                                boxShadow: Styles.myShadow,
                                color: indexSelected == 0
                                    ? Colors.green
                                    : Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                            decoration: BoxDecoration(
                                borderRadius: Styles.myradius,
                                boxShadow: Styles.myShadow,
                                color: indexSelected == 1
                                    ? Colors.red
                                    : Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
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
                            decoration: BoxDecoration(
                                borderRadius: Styles.myradius,
                                boxShadow: Styles.myShadow,
                                color: indexSelected == 2
                                    ? Colors.yellow
                                    : Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                types[0],
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
                            "SName": serialNumberController.text,
                            "item": name.text,
                            "RATE": int.parse(rate.text),
                            "Qtx": int.parse(qtx.text),
                            "FG": fg.text
                          });
                          setState(() {
                            tempItems.add({
                              "SName": int.parse(serialNumberController.text),
                              "item": name.text,
                              "RATE": int.parse(rate.text),
                              "Qtx": int.parse(qtx.text),
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
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 1),
                        child: Container(
                          height: 30,
                          width: width,
                          color: Colors.yellowAccent,
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: width * 0.1,
                                child: Text(
                                  "${tempItems[index]["SName"]}",
                                  style: Styles.poppins16w400,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: width * 0.45,
                                child: Text(
                                  "${tempItems[index]["item"]}",
                                  style: Styles.poppins16w400,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: width * 0.15,
                                child: Text(
                                  "${tempItems[index]["RATE"]}",
                                  style: Styles.poppins16w400,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: width * 0.2,
                                child: Text(
                                  "${tempItems[index]["Qtx"]}",
                                  style: Styles.poppins16w400,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: width * 0.1,
                                child: Text(
                                  "${tempItems[index]["FG"]}",
                                  style: Styles.poppins16w400,
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
