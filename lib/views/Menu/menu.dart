import 'package:admin/Services/Storage/outletMenu.dart';
import 'package:admin/common/app_styles_colors.dart';
import 'package:admin/views/Menu/addItem.dart';
import 'package:admin/views/Menu/deleteItem.dart';
import 'package:admin/views/Menu/editItem.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List items = [];
  final obj = Stroge();
  menuFromStorage() async {
    var data = obj.box.read("OutletID");
    if (data is List) {
      setState(() {
        items = [...data];
      });
    }
    obj.box.listenKey("OutletID", (value) {
      // print(value);
      if (value is List) {
        setState(() {
          items = [...value];
        });
      }
    });
  }

  @override
  void initState() {
    menuFromStorage();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width - 2;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          // flexibleSpace: ,
          toolbarHeight: kToolbarHeight,
          titleSpacing: 0,
          leadingWidth: 0,
          title: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: width * 0.1,
                child: Text(
                  "SName",
                  style: Styles.poppins16w400,
                ),
              ),
              Container(
                //color: Colors.amber,
                alignment: Alignment.center,
                width: width * 0.45,
                child: Text(
                  "item",
                  style: Styles.poppins16w400,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.15,
                child: Text(
                  "RATE",
                  style: Styles.poppins16w400,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.2,
                child: Text(
                  "Qtx",
                  style: Styles.poppins16w400,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.1,
                child: Text(
                  "FG",
                  style: Styles.poppins16w400,
                ),
              ),
            ],
          )),
      body: items.isEmpty
          ? Center(
              child: Text(
                "No Items yet\nPlease add items",
                style: Styles.poppins16w500,
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                Color color = Colors.white;
                Color textColor = Colors.white;
                if (items[index]["type"] == "Veg") {
                  color = const Color.fromARGB(255, 58, 139, 60);
                }
                if (items[index]["type"] == "Non-Veg") {
                  color = Colors.red;
                }
                if (items[index]["type"] == "Egg-Made") {
                  color = Colors.yellow;
                  textColor = Colors.black;
                }
                if (items[index]["type"] == "") {
                  //color = Colors.yellow;
                  textColor = Colors.black;
                }
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 1),
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
                            "${items[index]["SName"]}",
                            style: Styles.poppins14.copyWith(color: textColor),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: width * 0.45,
                          child: Text(
                            "${items[index]["item"]}",
                            style: Styles.poppins14.copyWith(color: textColor),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: width * 0.15,
                          child: Text(
                            "${items[index]["RATE"]}",
                            style: Styles.poppins14.copyWith(color: textColor),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: width * 0.2,
                          child: Text(
                            "${items[index]["Qtx"]}",
                            style: Styles.poppins14.copyWith(color: textColor),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: width * 0.1,
                          child: Text(
                            "${items[index]["FG"]}",
                            style: Styles.poppins14.copyWith(color: textColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: SpeedDial(
        closedForegroundColor: Colors.black,
        openForegroundColor: Colors.white,
        closedBackgroundColor: Colors.white,
        openBackgroundColor: Colors.black,
        labelsStyle: Styles.poppins16w400,
        labelsBackgroundColor: Colors.white,
        // controller: /* Your custom animation controller goes here */,
        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(
            child: const Icon(Icons.assignment_add),
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            label: 'Add item in Menu',
            onPressed: () {
              Get.to(const AddItem());
            },
            closeSpeedDialOnPressed: true,
          ),
          SpeedDialChild(
            child: const Icon(Icons.remove_from_queue_rounded),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            label: 'Remove item from Menu',
            onPressed: () {
              Get.to(const DeleteItem());
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.edit),
            foregroundColor: Colors.white,
            backgroundColor: Colors.amber,
            label: 'Edit item on Menu',
            onPressed: () {
              Get.to(const EditItem());
            },
          ),
          //  Your other SpeedDialChildren go here.
        ],
        child: const Icon(Icons.add),
      ),
    );
  }
}
