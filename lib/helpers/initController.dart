import 'package:admin/controllers/captainController.dart';
import 'package:admin/controllers/inventoryController.dart';
import 'package:admin/controllers/outletsController.dart';
import 'package:admin/controllers/storageController.dart';
import 'package:admin/controllers/tablesController.dart';
import 'package:get/get.dart';

init() async {
  Get.lazyPut(() => OutletsController());
  Get.lazyPut(() => StewardController());
  Get.lazyPut(() => TablesController());
  // Get.lazyPut(() => DbHive());
  Get.lazyPut(() => StorageController());
  Get.lazyPut(() => InventoryController());
  //Get.lazyPut(() => DbController());
}
