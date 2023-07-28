import 'package:admin/Models/item.dart';
import 'package:admin/Models/table.dart' as t;
import 'package:admin/controllers/inventoryController.dart';
import 'package:admin/controllers/outletsController.dart';
import 'package:admin/controllers/tablesController.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Models/outlet.dart';

class StorageController extends GetxController {
  final box = GetStorage();

  void updateOutlets(List<Outlet>? outLets) {
    List<Map<String, dynamic>>? data = [];
    for (var element in outLets!) {
     // print(element.toJson());
      data.add(element.toJson());
    }
    box.write('outlets', data);
  }

  getOutletsFromStorage() {
    var data = box.read('outlets');
    return data;
  }

  String uniquedKeyForInventoryBox() {
    return 'outletInventoryBox${Get.find<OutletsController>().selelctedOutlet!.uniqueId}#${Get.find<OutletsController>().selelctedOutlet!.outletName}'
        .trim()
        .replaceAll(" ", "");
  }

  String uniquedKeyForTablesBox() {
    return 'outletTablesBox${Get.find<OutletsController>().selelctedOutlet!.uniqueId}#${Get.find<OutletsController>().selelctedOutlet!.outletName}'
        .trim()
        .replaceAll(" ", "");
  }

  List<t.Table>? getTablesFromStorage() {
    List? data = box.read(uniquedKeyForTablesBox());

    if (data == null) {
      return null;
    } else {
      List<t.Table>? tables = data.map((e) => t.Table.fromJson(e)).toList();

      return tables;
    }
  }

  addNewTableStorage(t.Table table) {
    List<t.Table>? tables = getTablesFromStorage() ?? [];
    tables.add(table);
    updateTablesInStorage(tables);
  }

  updateTablesInStorage(List<t.Table> tables) {
    box.write(uniquedKeyForTablesBox(), tables.map((e) => e.toJson()).toList());
    Get.find<TablesController>().updateTables();
    update();
  }

  clearTableBox() {
    box.remove(uniquedKeyForTablesBox());
    Get.find<TablesController>().updateTables();
  }

  List<Item>? getItemsfromInventory() {
    List? data = box.read(uniquedKeyForInventoryBox());

    if (data == null) {
      return null;
    } else {
      List<Item>? items = data.map((e) => Item.fromjson(e)).toList();
      print(items);

      update();
      return items;
    }
  }

  updateItemsInStorage(List<Item> items) async {
    box.write(
        uniquedKeyForInventoryBox(), items.map((e) => e.tojson()).toList());
    Get.find<InventoryController>().updateItemsList();
  }

  addNewItemInventory(Item item) async {
    List<Item>? items = getItemsfromInventory() ?? [];
    items.add(item);
    updateItemsInStorage(items);
    // outletInventoryBox.write(
    //     uniquedKeyForInventoryBox(), items.map((e) => e.tojson()).toList());

    Get.find<InventoryController>().addrecentlyAddedItems(item);
  }
}
