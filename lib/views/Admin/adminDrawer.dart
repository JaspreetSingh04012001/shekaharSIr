import 'package:flutter/material.dart';

import '../../common/app_styles_colors.dart';

class AdminDrawer extends StatelessWidget {
const AdminDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
        var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = kToolbarHeight;
    return Container(
          decoration: const BoxDecoration(
              // border: Border(right: BorderSide(color: Colors.grey))
              // boxShadow: [
              // BoxShadow(, spreadRadius: 5)
              ),
          padding: EdgeInsets.only(
              top: statusBarHeight + appBarHeight + 1, bottom: 85), //ad
          child: Drawer(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(),
            elevation: 0,
            shadowColor: Colors.red,
            // backgroundColor: Colors.redAccent,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.grid_view_rounded,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ),
                  title: Text(
                    "Dashboard",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.black,
                  iconColor: Colors.black,
                  title: Text(
                    "Orders and Billing",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                  leading: const Icon(
                    Icons.receipt_long,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ), //add icon
                  childrenPadding:
                      const EdgeInsets.only(left: 60), //children padding
                  children: [
                    ListTile(
                      title: const Text("Child Category 1"),
                      onTap: () {
                        //action on press
                      },
                    )
                  ],
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.black,
                  iconColor: Colors.black,
                  title: Text(
                    "Tables",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                  leading: const Icon(
                    Icons.table_bar,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ), //add icon
                  childrenPadding:
                      const EdgeInsets.only(left: 60), //children padding
                  children: [
                    ListTile(
                      title: const Text("Child Category 1"),
                      onTap: () {
                        //action on press
                      },
                    )
                  ],
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.black,
                  iconColor: Colors.black,
                  title: Text(
                    "Menu Management",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                  leading: const Icon(
                    Icons.receipt,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ), //add icon
                  childrenPadding:
                      const EdgeInsets.only(left: 60), //children padding
                  children: [
                    ListTile(
                      title: const Text("Child Category 1"),
                      onTap: () {
                        //action on press
                      },
                    )
                  ],
                ),
                ListTile(
                  leading: const Icon(
                    Icons.inventory_2,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ),
                  title: Text(
                    "Inventory",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.black,
                  iconColor: Colors.black,
                  title: Text(
                    "CRM",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                  leading: const Icon(
                    Icons.groups,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ), //add icon
                  childrenPadding:
                      const EdgeInsets.only(left: 60), //children padding
                  children: [
                    ListTile(
                      title: const Text("Child Category 1"),
                      onTap: () {
                        //action on press
                      },
                    )
                  ],
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.black,
                  iconColor: Colors.black,
                  title: Text(
                    "Accounting",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                  leading: const Icon(
                    Icons.calculate,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ), //add icon
                  childrenPadding:
                      const EdgeInsets.only(left: 60), //children padding
                  children: [
                    ListTile(
                      title: const Text("Child Category 1"),
                      onTap: () {
                        //action on press
                      },
                    )
                  ],
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.black,
                  iconColor: Colors.black,
                  title: Text(
                    "Reports",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                  leading: const Icon(
                    Icons.summarize,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ), //add icon
                  childrenPadding:
                      const EdgeInsets.only(left: 60), //children padding
                  children: [
                    ListTile(
                      title: const Text("Child Category 1"),
                      onTap: () {
                        //action on press
                      },
                    )
                  ],
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.black,
                  iconColor: Colors.black,
                  title: Text(
                    "Configuration",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                  leading: const Icon(
                    Icons.settings,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ), //add icon
                  childrenPadding:
                      const EdgeInsets.only(left: 60), //children padding
                  children: [
                    ListTile(
                      title: const Text("Child Category 1"),
                      onTap: () {
                        //action on press
                      },
                    )
                  ],
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.black,
                  iconColor: Colors.black,
                  title: Text(
                    "User Management",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                  leading: const Icon(
                    Icons.manage_accounts,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ), //add icon
                  childrenPadding:
                      const EdgeInsets.only(left: 60), //children padding
                  children: [
                    ListTile(
                      title: const Text("Child Category 1"),
                      onTap: () {
                        //action on press
                      },
                    )
                  ],
                ),
                ListTile(
                  leading: const Icon(
                    Icons.storefront,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ),
                  title: Text(
                    "Marketplace",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.storefront,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ),
                  title: Text(
                    "Community Bazar",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.trolley,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ),
                  title: Text(
                    "Suppliers Hub",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.black,
                  iconColor: Colors.black,
                  title: Text(
                    "User Logs",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                  leading: const Icon(
                    Icons.manage_accounts,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ), //add icon
                  childrenPadding:
                      const EdgeInsets.only(left: 60), //children padding
                  children: [
                    ListTile(
                      title: const Text("Child Category 1"),
                      onTap: () {
                        //action on press
                      },
                    )
                  ],
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home_work,
                    color: Color.fromARGB(255, 164, 14, 3),
                    size: 15,
                  ),
                  title: Text(
                    "Add New HO",
                    style:
                        Styles.poppins12.copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}