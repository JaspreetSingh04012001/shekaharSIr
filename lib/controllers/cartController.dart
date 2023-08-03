import 'package:admin/Models/kot.dart';
import 'package:admin/controllers/storageController.dart';
import 'package:get/get.dart';

import '../Models/table.dart';

class CartController extends GetxController {
  //kot items  totalprice  selected Variation
  Table? selectedTable;
  Map<String, Kot> tableKot = {};
  int assignKotId() {
    List? storageKots = Get.find<StorageController>().getKotsFromStorage();
    if (storageKots != null) {
      return storageKots.length + 1;
    } else {
      return 1;
    }
    // Get.find<StorageController>().getKotsFromStorage() ;
  }

  void selectTable(Table index) {
    selectedTable = index;
    update();
  }
  double? cartPrice ;
  List<Kot>? currentKotsOnTable;
  //Kot? currentKotOnTable;
placeOrder(){

}
  void setcurrentKotOnTable(Kot k) {
    tableKot[selectedTable!.id.toString()] = k;
    //  currentKotOnTable = k;
    update();
  }

  void addKotToTable(Kot kot) {
    if (currentKotsOnTable == null) {
      currentKotsOnTable = [kot];
    } else {
      currentKotsOnTable!.add(kot);
    }

    update();
  }
}
