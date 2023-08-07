import 'dart:io';

import 'package:admin/controllers/OrdersController.dart';
import 'package:admin/controllers/captainController.dart';
import 'package:admin/controllers/cartController.dart';
import 'package:admin/controllers/inventoryController.dart';
import 'package:admin/controllers/outletsController.dart';
import 'package:admin/controllers/storageController.dart';
import 'package:admin/controllers/tablesController.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

init() async {
  final Directory appDocumentsDir = await getApplicationDocumentsDirectory();

  Get.lazyPut(() => OutletsController());
  Get.lazyPut(() => StewardController());
  Get.lazyPut(() => TablesController());
  // Get.lazyPut(() => DbHive());
  Get.lazyPut(() => StorageController());
  Get.lazyPut(() => InventoryController());

  Get.lazyPut(() => CartController());

  Get.lazyPut(() => OrdersController());

  // String path = '/data/data/com.jass.myapp/databases';
  // // Check if the directory exists
  // if (await Directory(path).exists()) {
  //   Hive.init(path);
  // } else {
  //   Directory(path).create();
  //   Hive.init(path);
  // }

// Initialize Hive
  Hive.init(appDocumentsDir.path);
  Get.find<StorageController>().boxHive = await Hive.openBox('myBox');
  Get.find<StorageController>().modificationsBox =
      await Hive.openBox('modificationsBox');
  Get.find<StorageController>().ordersBox = await Hive.openBox('ordersBox');

  //Get.find<StorageController>().eraseAll();

  //Get.lazyPut(() => DbController());
}
