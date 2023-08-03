import 'package:admin/Models/item.dart';
import 'package:admin/Models/itemsVariation.dart';

class Kot {
  /*  KOTNo  Date Time Table ItemACd ItemCode 
  ItemName Rate Tax Amount Department  StewardCode User
  ModifyTime DISCOUNT TRACKABLE QUANTITY
  */
  var KOTNo;

  List<KotItem>? kotItems;
  String? Date;
  String? Time;
  String? TableID;
  double totalprice = 0.0;

  Kot.fromjson(Map json) {
    KOTNo = json["KOTNo"].toString();
    if (json["kotItems"] != null) {
      kotItems = [];
      json["kotItems"].forEach((v) {
        kotItems?.add(KotItem.fromjson(v));
      });
    }
    Date = json["Date"].toString();
    Time = json["Time"].toString();
    TableID = json["TableID"].toString();
    totalprice = json["totalprice"];
  }

  toJson() {
    Map<String, dynamic> data = {
      "KOTNo": KOTNo,
      if (kotItems != null)
        "kotItems": kotItems!.map((e) => e.tojson()).toList(),
      "Date": Date,
      "Time": Time,
      "TableID": TableID,
      "totalprice": totalprice,
    };
    return data;
  }
}

class KotItem {
  var quantity;
  Item? item;
  ItemVariation? selectedVariation;
  var price;
  KotItem.fromjson(Map json) {
    quantity = json['quantity'];
    if (json['item'] is Item) {
      item = json['item'];
    } else {
      item = Item.fromjson(json['item']);
    }

    if (json['selectedVariation'] != null) {
      selectedVariation = ItemVariation.fromjson(json['selectedVariation']);
    }
    price = json['price'];
  }

  tojson() {
    Map<String, dynamic> data = {
      'quantity': quantity,
      'item': item!.tojson(),
      if (selectedVariation != null)
        'selectedVariation': selectedVariation!.tojson(),
      'price': price,
    };
    return data;
  }
}
