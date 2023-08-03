import 'package:admin/Models/item.dart';
import 'package:admin/controllers/storageController.dart';
import 'package:get/get.dart';

class InventoryController extends GetxController {
  List<Item>? items;
  List<Item> recentlyAddedItems = [];
  List<dynamic> autoCodes = [];

  removeItem(int index) {
    items!.removeAt(index);
    Get.find<StorageController>().updateItemsInStorage(items ?? []);
    //update();
  }

  updateItemsList() {
    items = Get.find<StorageController>().getItemsfromInventory();
    print(items);
    if (items != null) {
      for (var element in items!) {
        if (!autoCodes.contains(element.autoCode)) {
          autoCodes.add(element.autoCode);
        }

        // autoCodes.add(element.autoNum);
      }
    } else {
      // autoCodes.add("0");
    }
    update();
  }

  addrecentlyAddedItems(Item item) {
    recentlyAddedItems.add(item);
    update();
  }

  int assignNewAutoNum() {
    updateItemsList();
    int autoNum = 0;
    while (autoCodes.contains(autoNum)) {
      autoNum = autoNum + 1;
    }

    return autoNum;
  }

  bool verifyAutoCode(String autoCode) {
    return autoCodes.contains(autoCode);
  }
}
