import 'package:admin/common/app_styles_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../Services/Storage/outletMenu.dart';

class EditItem extends StatefulWidget {
  const EditItem({Key? key}) : super(key: key);

  @override
  _EditItemState createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List _items = [];
  List _filteredItems = [];
  final obj = Stroge();
  menuFromStorage() async {
    var data = obj.box.read("OutletID");
    if (data is List) {
      setState(() {
        // _items = [...data];
        _items = data.toSet().toList();

        _filteredItems.addAll(_items);
      });
    }
    // obj.box.listenKey("OutletID", (value) {
    //   // print(value);
    //   if (value is List) {
    //     setState(() {
    //       _items = [...value];
    //       _filteredItems.addAll(_items);
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    _filteredItems;
    _items;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    menuFromStorage();

    super.initState();
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = _items.where((item) {
        if (item["SName"].toString().contains(query) ||
            item["item"].toLowerCase().contains(query.toLowerCase())) {
          return true;
        } else {
          return false;
        }
      }).toList();
    });
  }

  // void _addItem() {
  //   final newIndex = _items.length;
  //   //_items.add('Item ${newIndex + 1}');
  //   _filteredItems.add(_items[newIndex]);
  //   _listKey.currentState?.insertItem(newIndex);
  // }

  void _removeItem(int index) {
    _listKey.currentState?.removeItem(index, (context, animation) {
      if (index < _filteredItems.length) {
        return _buildListItem(context, _filteredItems[index], animation);
      } else {
        return Container();
      }
    }
        // _buildListItem(context, _filteredItems[index], animation),
        );
    _filteredItems.removeAt(index);
    _items.removeAt(index);
    Stroge().box.write("OutletID", _items);
  }

  Widget _buildListItem(
      BuildContext context, var item, Animation<double> animation) {
    double width = MediaQuery.of(context).size.width;
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: Styles.myradius),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: width * 0.1,
                  child: Text(
                    "${item["SName"]}.",
                    style: Styles.poppins14,
                  ),
                ),
                Container(
                  //color: Colors.amber,
                  alignment: Alignment.center,
                  width: width * 0.45,
                  child: Text(
                    "${item["item"]}",
                    style: Styles.poppins14,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.15,
                  child: Text(
                    "${item["RATE"]}",
                    style: Styles.poppins14,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.2,
                  child: Text(
                    "${item["Qtx"]}",
                    style: Styles.poppins14,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: width * 0.1,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Styles.primaryColor,
                    ),
                    onPressed: () {
                      dynamic tempindex;

                      for (var element in _items) {
                        if (element["SName"] == item["SName"]) {
                          tempindex = _items.indexOf(element);
                        }
                      }
                      TextEditingController name = TextEditingController();

                      TextEditingController rate = TextEditingController();
                      TextEditingController qtx = TextEditingController();
                      TextEditingController fg = TextEditingController();

                      name.text = item["item"];
                      rate.text = item["RATE"].toString();
                      qtx.text = item["Qtx"].toString();
                      fg.text = item["FG"];
                      final formKey = GlobalKey<FormState>();
                      // List items = [];

                      List<String> types = ["Veg", "Non-Veg", "Egg-Made"];
                      int? indexSelected = types.indexOf(item["type"]);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(content: StatefulBuilder(builder:
                                (BuildContext context, StateSetter setStatee) {
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: SingleChildScrollView(
                                    child: Form(
                                      key: formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          const SizedBox(height: 16.0),
                                          TextFormField(
                                            controller: name,
                                            decoration: InputDecoration(
                                              labelText: 'Item name',
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
                                            style:
                                                const TextStyle(fontSize: 16.0),
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
                                            style:
                                                const TextStyle(fontSize: 16.0),
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
                                            style:
                                                const TextStyle(fontSize: 16.0),
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
                                            style:
                                                const TextStyle(fontSize: 16.0),
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
                                          Wrap(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setStatee(() {
                                                    indexSelected = 0;
                                                  });
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  // width: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          Styles.myradius,
                                                      boxShadow:
                                                          Styles.myShadow,
                                                      color: indexSelected == 0
                                                          ? Colors.green
                                                          : Colors.white),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                      types[0],
                                                      style: Styles
                                                          .poppins16w400
                                                          .copyWith(
                                                        color:
                                                            indexSelected != 0
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
                                                  setStatee(() {
                                                    indexSelected = 1;
                                                  });
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  // width: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          Styles.myradius,
                                                      boxShadow:
                                                          Styles.myShadow,
                                                      color: indexSelected == 1
                                                          ? Colors.red
                                                          : Colors.white),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                      types[1],
                                                      style: Styles
                                                          .poppins16w400
                                                          .copyWith(
                                                        color:
                                                            indexSelected != 1
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
                                                  setStatee(() {
                                                    indexSelected = 2;
                                                  });
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  // width: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          Styles.myradius,
                                                      boxShadow:
                                                          Styles.myShadow,
                                                      color: indexSelected == 2
                                                          ? Colors.yellow
                                                          : Colors.white),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Text(
                                                      types[2],
                                                      style: Styles
                                                          .poppins16w400
                                                          .copyWith(
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Gap(25),
                                          ElevatedButton(
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                formKey.currentState!.save();
                                                print(
                                                    "$indexSelected  ${name.text} ${rate.text} ${qtx.text} ${fg.text}");

                                                // Stroge().addItemMenu(item: {
                                                //   "SName": int.parse(serialNumberController.text),
                                                //   "item": name.text,
                                                //   "RATE": int.parse(rate.text),
                                                //   "Qtx": qtx.text.isEmpty ? 0 : int.parse(qtx.text),
                                                //   "FG": fg.text,
                                                //   "type": indexSelected == null
                                                //       ? ""
                                                //       : types[indexSelected ?? 0]
                                                // });
                                                /*    tempItems.add({
                              "SName": int.parse(serialNumberController.text),
                              "item": name.text,
                              "RATE": int.parse(rate.text),
                              "Qtx": qtx.text.isEmpty ? 0 : int.parse(qtx.text),
                              "FG": fg.text,
                              "type": indexSelected == null
                                  ? ""
                                  : types[indexSelected ?? 0]
                            }); */
                                                setState(() {
                                                  item["item"] = name.text;
                                                  item["RATE"] = rate.text;
                                                  item["Qtx"] = qtx.text;
                                                  item["FG"] = fg.text;
                                                  _items[tempindex]["item"] =
                                                      name.text;
                                                  _items[tempindex]["RATE"] =
                                                      int.parse(rate.text);
                                                  _items[tempindex]["Qtx"] =
                                                      qtx.text.isEmpty
                                                          ? 0
                                                          : int.parse(qtx.text);
                                                  _items[tempindex]["FG"] =
                                                      fg.text;
                                                  _items[tempindex]["type"] =
                                                      indexSelected == null
                                                          ? ""
                                                          : types[
                                                              indexSelected ??
                                                                  0];
                                                });

                                                Stroge()
                                                    .box
                                                    .write("OutletID", _items);

                                                name.clear();
                                                rate.clear();
                                                qtx.clear();

                                                Navigator.of(context).pop();
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Styles.primaryColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 16.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            child: Text(
                                              'Update Item',
                                              style: Styles.poppins16w500
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }));
                          });
                      // setState(() {
                      //   item["RATE"] = 500;
                      // });
                    },
                  ),
                ),
              ],
            )),
      ),

      //  ListTile(
      //   title: Text(
      //     "${item["SName"]}. ${item["item"]}",
      //     style: Styles.poppins14,
      //   ),
      //   trailing: IconButton(
      //     icon: const Icon(
      //       Icons.delete,
      //       color: Colors.red,
      //     ),
      //     onPressed: () => _removeItem(_filteredItems.indexOf(item)),
      //   ),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Item in Menu",
          style: Styles.poppins18w600,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterItems,
              decoration: InputDecoration(
                //errorBorder: const InputBorder(),

                errorStyle: Styles.poppins16w400.copyWith(color: Colors.red),
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
          const Gap(10),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: width * 0.1,
                child: Text(
                  "Sno.",
                  style:
                      Styles.poppins16w400.copyWith(color: Styles.primaryColor),
                ),
              ),
              Container(
                //color: Colors.amber,
                alignment: Alignment.center,
                width: width * 0.45,
                child: Text(
                  "Item",
                  style:
                      Styles.poppins16w400.copyWith(color: Styles.primaryColor),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.15,
                child: Text(
                  "Rate",
                  style:
                      Styles.poppins16w400.copyWith(color: Styles.primaryColor),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.2,
                child: Text(
                  "Qtx",
                  style:
                      Styles.poppins16w400.copyWith(color: Styles.primaryColor),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.1,
              ),
            ],
          ),
          const Gap(10),
          Expanded(
            child: _filteredItems.isEmpty
                ? Center(
                    child: Text(
                    "No Items Found",
                    style: Styles.poppins14,
                  ))
                : AnimatedList(
                    key: _listKey,
                    initialItemCount: _filteredItems.length,
                    itemBuilder: (context, index, animation) {
                      if (index < _filteredItems.length) {
                        return _buildListItem(
                            context, _filteredItems[index], animation);
                      } else {
                        return Container();
                      }
                    },
                  ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _addItem,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
