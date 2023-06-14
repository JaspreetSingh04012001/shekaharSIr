import 'package:admin/Services/Storage/outletMenu.dart';
import 'package:admin/common/app_styles_colors.dart';
import 'package:admin/views/Menu/addItem.dart';
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
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 1),
                  child: Container(
                    height: 30,
                    width: width,
                    color: Colors.amber,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: width * 0.1,
                          child: Text(
                            "${items[index]["SName"]}",
                            style: Styles.poppins16w400,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: width * 0.45,
                          child: Text(
                            "${items[index]["item"]}",
                            style: Styles.poppins16w400,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: width * 0.15,
                          child: Text(
                            "${items[index]["RATE"]}",
                            style: Styles.poppins16w400,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: width * 0.2,
                          child: Text(
                            "${items[index]["Qtx"]}",
                            style: Styles.poppins16w400,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: width * 0.1,
                          child: Text(
                            "${items[index]["FG"]}",
                            style: Styles.poppins16w400,
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
              // obj.addItemMenu(item: {
              //   "SName": 11,
              //   "item": "Pav bhaji",
              //   "RATE": 10,
              //   "Qtx": -17,
              //   "FG": "F"
              // });
              // setState(() {
              //   // _text = 'You pressed \"Let\'s start a run!\"';
              // });
            },
            closeSpeedDialOnPressed: true,
          ),
          SpeedDialChild(
            child: const Icon(Icons.remove_from_queue_rounded),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            label: 'Remove item from Menu',
            onPressed: () {
              setState(() {
                //  _text = 'You pressed \"Let\'s go for a walk!\"';
              });
            },
          ),
          //  Your other SpeedDialChildren go here.
        ],
        child: const Icon(Icons.add),
      ),
    );
  }
}
