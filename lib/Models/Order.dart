import 'package:admin/Models/kot.dart';
import 'package:admin/Models/steward.dart';

class Order {
  Steward? steward;
  String? orderId;
  String? date;
  String? time;
  String? tableID;
  List<Kot>? kots;
  bool paymentStatus = false;
  bool tableCleared = false;
  var totalprice = 0.0;

  Order.fromJson(Map json) {
    if (json["steward"] != null) {
      steward = Steward.fromJson(json["steward"]);
    }
    orderId = json["orderId"].toString();
    date = json["date"].toString();
    if (json["kots"] != null) {
      kots = [];
      json["kots"].forEach((v) {
        kots?.add(Kot.fromjson(v));
      });
    }

    time = json["time"].toString();
    tableID = json["tableID"].toString();
    paymentStatus = json["paymentStatus"] ?? false;
    tableCleared = json["tableCleared"] ?? false;
    totalprice = json["totalprice"];
  }
  Map<String, dynamic> tojson() {
    Map<String, dynamic> json = {};
    if (steward != null) {
      json["steward"] = steward?.tojson();
    }
    json["orderId"] = orderId;
    json["date"] = date;
    json["time"] = time;
    json["tableID"] = tableID;
    json["paymentStatus"] = paymentStatus;
    json["tableCleared"] = tableCleared;
    json["totalprice"] = totalprice;
    if (kots != null) {
      json["kots"] = kots!.map((e) => e.toJson()).toList();
    }
    return json;
  }
}
