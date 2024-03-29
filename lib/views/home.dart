import 'package:admin/common/app_styles_colors.dart';
import 'package:admin/common/reusable%20widgets/text_field_prefix_icon.dart';
import 'package:admin/views/All%20Outlets/allOutletSales.dart';
import 'package:admin/views/Menu/menu.dart';
import 'package:admin/views/Operation/operation.dart';
import 'package:admin/views/Tables/tables.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../common/reusable widgets/myCustomBottomNav.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> list = ["All Outlets", "Singh's Tandoor"];
  String dropdownValue = "All Outlets";
  int currentIndex = 0;
  int allOutletCurrentIndex = 0;
  List pages = [
    const Tables(),
    const Operation(),
    const Menu(),
    Container(),
  ];
  List allOutletPages = [
    const AllOutletSales(),
    const Operation(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = kToolbarHeight;
    return Scaffold(
        drawerScrimColor: Colors.transparent,

        //  endDrawerSemantics: DrawerSemantics.bottom,
        // drawer: 
        appBar: AppBar(
          // centerTitle: true,
          titleSpacing: 0,
          elevation: 10,
          title: InkWell(
            onTap: () {
              showDialog(
                  //barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      content: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " Select Outlets",
                                  style: Styles.poppins14,
                                  overflow: TextOverflow.ellipsis,
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
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TextfieldPrefixIcon(
                                    controller: TextEditingController(),
                                    hintText: "Search",
                                    icon: Icons.search),
                              ),
                            ),
                            Expanded(child:
                                ListView.builder(itemBuilder: (context, index) {
                              if (index == 0) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      dropdownValue = "All Outlets";
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 218, 215),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.grey.shade200)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: ListTile(
                                        dense: true,
                                        contentPadding: EdgeInsets.zero,
                                        leading: const Icon(
                                          Icons.store_mall_directory_outlined,
                                          color: Colors.black,
                                          size: 15,
                                        ),
                                        title: Text(
                                          "All Outlets",
                                          style: Styles.poppins12,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      dropdownValue = "Singh's Tandoor";
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.grey.shade200)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: ListTile(
                                        dense: true,
                                        contentPadding: EdgeInsets.zero,
                                        leading: const Icon(
                                          Icons.store_mall_directory_outlined,
                                          color: Colors.black,
                                          size: 15,
                                        ),
                                        title: Text(
                                          "Singh's Tandoor",
                                          style: Styles.poppins12,
                                        ),
                                        trailing: Text(
                                          "[id : 1009]",
                                          style: Styles.poppins12,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            })),
                            const Gap(3),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              //width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      dropdownValue,
                      style: Styles.poppins12
                          .copyWith(fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // const Gap(5),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
            ),
          ),
          // title: DropdownButton<String>(

          //   padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          //   value: dropdownValue,
          //   // icon: const Icon(Icons.arrow_downward),
          //   // elevation: 16,
          //   style: Styles.poppins16w400,
          //   // underline: Container(
          //   //   height: 2,
          //   //   color: Colors.deepPurpleAccent,
          //   // ),
          //   onChanged: (String? value) {
          //     // This is called when the user selects an item.
          //     setState(() {
          //       dropdownValue = value!;
          //     });
          //   },
          //   items: list.map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(value),
          //     );
          //   }).toList(),
          // ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                )),
          ],
          //foregroundColor: Colors.white,
        ),
        body: dropdownValue == "All Outlets"
            ? allOutletPages[allOutletCurrentIndex]
            : pages[currentIndex],
            
        bottomNavigationBar: dropdownValue == "All Outlets"
            ? Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 15,
                      spreadRadius: 2,
                      color: Colors.grey.shade300)
                ]),
                // color: Colors.amberAccent,
                height: 85,
                child: CustomLineIndicatorBottomNavbar(
                  selectedIconSize: 25,
                  unselectedIconSize: 23,
                  selectedColor: const Color.fromARGB(255, 164, 14, 3),

                  unSelectedColor: Colors.black54,
                  backgroundColor: Colors.white,
                  //splashColor: Colors.red,
                  currentIndex: allOutletCurrentIndex,

                  onTap: (index) {
                    setState(() {
                      allOutletCurrentIndex = index;
                    });
                  },
                  enableLineIndicator: true,
                  lineIndicatorWidth: 5,
                  indicatorType: IndicatorType.Top,

                  // gradient: LinearGradient(
                  //   colors: kGradients,
                  // ),

                  customBottomBarItems: [
                    CustomBottomBarItems(
                      label: 'Sales',
                      icon: Icons.signal_cellular_alt,
                    ),
                    CustomBottomBarItems(
                        label: 'Supplier', icon: Icons.trolley),
                    CustomBottomBarItems(
                      label: 'More',
                      icon: Icons.more_horiz,
                    ),
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 15,
                      spreadRadius: 2,
                      color: Colors.grey.shade300)
                ]),
                // color: Colors.amberAccent,
                height: 85,
                child: CustomLineIndicatorBottomNavbar(
                  selectedIconSize: 25,
                  unselectedIconSize: 23,
                  selectedColor: const Color.fromARGB(255, 164, 14, 3),

                  unSelectedColor: Colors.black54,
                  backgroundColor: Colors.white,
                  //splashColor: Colors.red,
                  currentIndex: currentIndex,

                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  enableLineIndicator: true,
                  lineIndicatorWidth: 4,
                  indicatorType: IndicatorType.Top,

                  // gradient: LinearGradient(
                  //   colors: kGradients,
                  // ),

                  customBottomBarItems: [
                    CustomBottomBarItems(
                      label: 'Tables',
                      icon: Icons.restaurant_menu_sharp,
                    ),
                    CustomBottomBarItems(
                      label: 'Orders',
                      icon: Icons.receipt_long,
                    ),
                    CustomBottomBarItems(
                        label: 'Menu', icon: Icons.menu_book_rounded),
                    CustomBottomBarItems(
                      label: 'More',
                      icon: Icons.more_horiz,
                    ),
                  ],
                ),
              ));
  }
}


































