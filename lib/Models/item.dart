import 'itemsVariation.dart';

class Item {
  

  int? autoNum;
  String? autoCode;
  String? createdAt;
  String? shortName;
  String? itemname;
  String? department;
  String? category;
  String? type;
  String? rate;
  String? tax;
  String? cess;
  bool? inclusiveOrExclusive;
  bool? discountable;
  String? discount;
  bool? discontinued;
  bool? isFinishedGood;
  String? qty;
  String? sellUom;
  String? altName;
  bool? isRateDeciaml;
  List<ItemVariation>? variations;
  Item.fromjson(Map<String, dynamic> json) {
    autoNum = json["autoNum"];
    autoCode = json["autoCode"].toString();
    createdAt = json["createdAt"].toString();
    shortName = json["shortName"].toString();
    itemname = json["itemname"].toString();
    rate = json["rate"].toString();
    department = json["department"];
    tax = json["tax"].toString();
    cess = json["cess"].toString();
    inclusiveOrExclusive = json["inclusiveOrExclusive"];
    discountable = json["discountable"];
    discount = json["discount"].toString();
    discontinued = json["discontinued"];
    isFinishedGood = json["isFinishedGood"];
    qty = json["qty"].toString();
    sellUom = json["sellUom"].toString();
    altName = json["altName"].toString();
    category = json["category"];
    type = json["type"];
    isRateDeciaml = json["isRateDeciaml"];
    if (json["variations"] != null) {
      variations = [];
      json["variations"].forEach((v) {
        variations?.add(ItemVariation.fromjson(v));
      });
    }
  }
  tojson() {
    Map<String, dynamic> data = {
      "autoNum": autoNum,
      "autoCode": autoCode,
      "shortName": shortName,
      "itemname": itemname,
      "rate": rate,
      "department": department,
      "tax": tax,
      "cess" : cess,
      "inclusiveOrExclusive": inclusiveOrExclusive,
      "discountable": discountable,
      "discount": discount,
      "discontinued": discontinued,
      "isFinishedGood": isFinishedGood,
      "qty": qty,
      "sellUom": sellUom,
      "altName": altName,
      "category": category,
      "type": type,
      "isRateDeciaml": isRateDeciaml,
    };
    if (variations != null) {
      data["variations"] = variations?.map((v) => v.tojson()).toList();
    }
    return data;
  }
}
