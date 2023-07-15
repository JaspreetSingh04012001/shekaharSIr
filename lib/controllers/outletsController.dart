import 'package:admin/Models/outlet.dart';
import 'package:admin/controllers/tablesController.dart';
import 'package:admin/views/Admin/BottomNav/more.dart';
import 'package:admin/views/Admin/Drawer/outletsManagement.dart';
import 'package:admin/views/OutletManager/managerOrders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin/Models/table.dart' as t;
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
    Container(), //Third tab
  ];
  List adminNavPages = [
    const AllOutletSales(),
    const Operation(),
    const More(),
    const OutletsManagement()
  ];
  Outlet? selelctedOutlet;
  List<Outlet>? _outLets;
  bool bottomNavVisible = true;
  bool selectOutletVisible = true;

//geters
  List<Outlet>? get outLets => _outLets;

  int bottomTabIndex = 0;
  int bottomTabIndexAllOutlets = 0;
  String? selelctedtittle;
//String? get  selelctedOutlet => selelctedOutlet ;

//seters
  int provideNewOutletId() {
    if (_outLets == null || _outLets!.isEmpty) {
      return 1;
    } else {
      int newId = 0;
      List<int> oldIds =
          _outLets!.map((e) => int.parse(e.AutoCode.toString())).toList();

      while (newId <= _outLets!.length || oldIds.contains(newId)) {
        newId = newId + 1;
      }
      return newId;
    }
  }

  void setOutletsList(List<Outlet>? outLets) {
    _outLets = outLets;

    update();
  }

  void setOutlet(int index) {
    selelctedOutlet = _outLets![index];

    Get.find<TablesController>().setTables(_outLets![index].tables);
    update();
  }

  void updateTablesofOutlet(List<t.Table>? tables) {
    _outLets![_outLets!.indexOf(selelctedOutlet!)].tables = tables;
    update();
  }

  void setselelctedtittle(String name) {
    selelctedtittle = name;
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

  void setbottomNavVisible({required bool visible}) {
    bottomNavVisible = visible;
    update();
  }

  void setselectOutletVisible({required bool visible}) {
    selectOutletVisible = visible;
    update();
  }
}
