import 'package:admin/Models/table.dart';
import 'package:admin/controllers/cartController.dart';
import 'package:admin/controllers/storageController.dart';
import 'package:get/get.dart';

class TablesController extends GetxController {
  List ids = [];
  Table? selectedTable;
  List<Table>? tables;

  void selectTable(Table index) {
    selectedTable = index;

    update();
    Get.find<CartController>().selectTable(index);
  }

  void setTables(List<Table>? tabless) {
    tables = tabless;
    update();
  }

  updateTables() {
    tables = Get.find<StorageController>().getTablesFromStorage();
    if (tables != null) {
      for (var element in tables!) {
        if (!ids.contains(element.id)) {
          ids.add(element.id);
        }
      }
    }

    update();
  }

  void addTable(Table table) {
    if (tables != null) {
      tables?.add(table);
    } else {
      tables = [table];
    }

    update();
    Get.find<StorageController>().updateTablesInStorage(tables ?? []);
  }

  int provideNewTableId() {
    if (tables == null || tables!.isEmpty) {
      return 1;
    } else {
      int newId = 0;
      for (var element in tables!) {
        print(element.toJson());
      }
      List<int> oldIds =
          tables!.map((e) => int.parse(e.autoCode.toString())).toList();

      while (newId <= tables!.length || oldIds.contains(newId)) {
        newId = newId + 1;
      }
      return newId;
    }
  }
}
