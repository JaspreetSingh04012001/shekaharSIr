import 'package:admin/Models/Order.dart';
import 'package:admin/controllers/storageController.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  List<Order>? orders;
  int assignOrderId() {
    getorders();
    if (orders != null) {
      return orders!.length + 1;
    } else {
      return 1;
    }
    // Get.find<StorageController>().getKotsFromStorage() ;
  }

  getorders() {
    List? data = Get.find<StorageController>().getOrdersFromStorage();
    if (data != null) {
     
      orders = data.map((e) => Order.fromJson(e)).toList();
    }
    update();
  }
}
