import 'package:admin/Models/outlet.dart';
import 'package:admin/Models/steward.dart';
import 'package:admin/controllers/inventoryController.dart';
import 'package:admin/controllers/storageController.dart';
import 'package:admin/controllers/tablesController.dart';
import 'package:admin/views/Admin/BottomNav/more.dart';
import 'package:admin/views/Admin/Drawer/outletsManagement.dart';
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
    Container(), //Third tab
  ];
  List adminNavPages = [
    const AllOutletSales(),
    const Operation(),
    const More(),
    const OutletsManagement()
  ];
  int? currentOutletIndex;
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

  void updateOutletInStorage() {
    outLets![currentOutletIndex ?? 0] = selelctedOutlet!;
    Get.find<StorageController>().updateOutlets(outLets);
  }

//seters
  void updateOutletDepartment(String department) {
    if (selelctedOutlet!.departements == null) {
      selelctedOutlet!.departements = [];
      selelctedOutlet!.departements!.add(department);
      updateOutletInStorage();
    } else {
      if (selelctedOutlet!.departements!.contains(department)) {
        Get.snackbar("Name is taken", "try different name for this department",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else {
        selelctedOutlet!.departements!.add(department);
        updateOutletInStorage();
      }
    }
    update();
  }

  void updateOutletStewards(Steward stwaerd) {
    if (selelctedOutlet!.activeStewards == null) {
      selelctedOutlet!.activeStewards = [];
      print(stwaerd.tojson());
      selelctedOutlet!.activeStewards!.add(stwaerd);
      updateOutletInStorage();
    } else {
      print(stwaerd.tojson());
      selelctedOutlet!.activeStewards!.add(stwaerd);
      updateOutletInStorage();
    }
    update();
  }

  void updateOutletCategories(String category) {
    if (selelctedOutlet!.categories == null) {
      selelctedOutlet!.categories = [];
      selelctedOutlet!.categories!.add(category);
      updateOutletInStorage();
    } else {
      if (selelctedOutlet!.categories!.contains(category)) {
        Get.snackbar("Name is taken", "try different name for this category",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      } else {
        selelctedOutlet!.categories!.add(category);
        updateOutletInStorage();
      }
    }
    update();
  }

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
    currentOutletIndex = index;
    selelctedOutlet = _outLets![index];

    update();
    Get.find<TablesController>().updateTables();
    Get.find<InventoryController>().updateItemsList();
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
