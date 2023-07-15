import 'package:admin/Models/table.dart';
import 'package:admin/controllers/outletsController.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class TablesController extends GetxController {
  List<Table>? tables;
  void setTables(List<Table>? tabless) {
    tables = tabless;
    update();
  }

  void addTable(Table table) {
    tables?.add(table);
    Get.find<OutletsController>().updateTablesofOutlet(tables);
    update();
  }

  void removeTable(String autoCode) {
    tables?.removeWhere(
      (element) {
        if (element.autoCode == autoCode) {
          return true;
        } else {
          return false;
        }
      },
    );
    Get.find<OutletsController>().updateTablesofOutlet(tables);
    update();
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
