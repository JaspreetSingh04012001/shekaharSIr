import 'package:admin/views/Admin/BottomNav/more.dart';
import 'package:admin/views/OutletManager/managerOrders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/All Outlets/allOutletSales.dart';
import '../views/Menu/menu.dart';
import '../views/Operation/operation.dart';
import '../views/Tables/tables.dart';

class OutletsController extends GetxController {
  List managerNavPages = [
    const Tables(),
    const ManagerOrders(),
    const Menu(),
    const More(),
  ];
  List captainNavPages = [
    const Tables(),
    const Menu(),
    Container(),
  ];
  List adminNavPages = [
    const AllOutletSales(),
    const Operation(),
    const More(),
  ];
  String? selelctedOutlet;
  List<String>? _outLets;

//geters
  List<String>? get outLets => _outLets;

  int bottomTabIndex = 0;
  int bottomTabIndexAllOutlets = 0;
//String? get  selelctedOutlet => selelctedOutlet ;

//seters
  void setOutletsList(List<String>? outLets) {
    _outLets = outLets;
    update();
  }

  void setOutlet(String name) {
    selelctedOutlet = name;
    update();
  }

  void setbottomTabIndex(int index) {
    bottomTabIndex = index;
    update();
  }

  void setbottomTabIndexAllOutlets(int index) {
    bottomTabIndexAllOutlets = index;
    update();
  }
}
