import 'package:admin/Models/Order.dart';
import 'package:admin/Models/item.dart';
import 'package:admin/Models/kot.dart';
import 'package:admin/Models/table.dart' as t;
import 'package:admin/controllers/OrdersController.dart';
import 'package:admin/controllers/inventoryController.dart';
import 'package:admin/controllers/outletsController.dart';
import 'package:admin/controllers/tablesController.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';

import '../Models/outlet.dart';

class StorageController extends GetxController {
  final box = GetStorage();
  var boxHive;
  var modificationsBox;
  late Box<dynamic> ordersBox;

  upadteItemModifications(Item item) {
    var date = DateTime.now().toString();

    Map? entries = getItemModifications() ?? {};
    if (entries[item.autoCode] == null) {
      entries[item.autoCode] = [
        {date: item.tojson()}
      ];
    } else {
      entries[item.autoCode].add({date: item.tojson()});
    }

    modificationsBox.put(uniquedItemModificationsBox(), entries);
    update();
  }

  Map? getItemModifications() {
    // boxHive.put(uniquedKeyForKotBox(), 'David');
    return modificationsBox.get(uniquedItemModificationsBox());
  }

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

  String uniquedKeyForKotBox() {
    return 'outletKoTBox${Get.find<OutletsController>().selelctedOutlet!.uniqueId}#${Get.find<OutletsController>().selelctedOutlet!.outletName}'
        .trim()
        .replaceAll(" ", "");
  }

  String uniquedKeyForOrdersBox() {
    return 'outletOrdersBox${Get.find<OutletsController>().selelctedOutlet!.uniqueId}#${Get.find<OutletsController>().selelctedOutlet!.outletName}'
        .trim()
        .replaceAll(" ", "");
  }

  String uniquedItemModificationsBox() {
    return 'ItemModifications${Get.find<OutletsController>().selelctedOutlet!.uniqueId}#${Get.find<OutletsController>().selelctedOutlet!.outletName}'
        .trim()
        .replaceAll(" ", "");
  }

  upadteKotsInStorage(Kot k) {
    List? kots = getKotsFromStorage();
    if (kots == null) {
      kots = [k.toJson()];
    } else {
      kots.add(k.toJson());
    }
    boxHive.put(uniquedKeyForKotBox(), kots);
    update();
  }

  List? getKotsFromStorage() {
    // boxHive.put(uniquedKeyForKotBox(), 'David');
    return boxHive.get(uniquedKeyForKotBox());
  }

  List? getOrdersFromStorage() {
   
    return ordersBox.get(uniquedKeyForOrdersBox());
  }

  clearorders() {
    ordersBox.clear();
    boxHive.clear();
  }

  updateOrdersInStorage() {
    
    ordersBox.put(uniquedKeyForOrdersBox(), Get.find<OrdersController>().orders!.map((e) => e.tojson()).toList());
  }

  addOrderInStorage(Order k) {
    List? orders = getOrdersFromStorage();
    if (orders == null) {
      orders = [k.tojson()];
    } else {
      
      orders.add(k.tojson());
    }
   
    ordersBox.put(uniquedKeyForOrdersBox(), orders);
    Get.find<OrdersController>().getorders();
    update();
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
      // print(items);

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

    upadteItemModifications(item);
    // outletInventoryBox.write(
    //     uniquedKeyForInventoryBox(), items.map((e) => e.tojson()).toList());

    Get.find<InventoryController>().addrecentlyAddedItems(item);
  }

  replaceitemInventory(Item item, int index) async {
    List<Item>? items = getItemsfromInventory();
    items?[index] = item;
    updateItemsInStorage(items!);

    upadteItemModifications(item);
  }
}
