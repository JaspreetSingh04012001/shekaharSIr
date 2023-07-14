import 'package:admin/Services/Storage/DbHive.dart';
import 'package:admin/Services/Storage/sembestStorage.dart';
import 'package:admin/controllers/captainController.dart';
import 'package:admin/controllers/outletsController.dart';
import 'package:admin/controllers/storageController.dart';
import 'package:get/get.dart';

init() async {
  Get.lazyPut(() => OutletsController());
  Get.lazyPut(() => StewardController());
  // Get.lazyPut(() => DbHive());
  Get.lazyPut(() => StorageController());
  Get.lazyPut(() => DbController());
}
