import 'itemsVariation.dart';

class Item {
  int? autoNum;
  String? autoCode;
  String? createdAt;
  String? modifiedAt;
  String? shortName;
  String? itemname;
  String? department;
  String? category;
  String? type;
  String? rate;
  String? tax;
  String? cess;
  bool? inclusive;
  bool? discountable;
  String? discount;
  bool? discontinued;
  bool? isFinishedGood;
  String? qty;
  String? sellUom;
  String? altName;
  bool? isRateDeciaml;
  List<ItemVariation>? variations;
  Item.fromjson(Map json) {
    autoNum = json["autoNum"];
    autoCode = json["autoCode"];
    createdAt = json["createdAt"];
    modifiedAt = json["modifiedAt"];
    shortName = json["shortName"];
    itemname = json["itemname"];
    rate = json["rate"];
    department = json["department"];
    tax = json["tax"];
    cess = json["cess"];
    inclusive = json["inclusive"];
    discountable = json["discountable"];
    discount = json["discount"];
    discontinued = json["discontinued"];
    isFinishedGood = json["isFinishedGood"];
    if (json["isFinishedGood"]) {
      qty = json["qty"].toString();
    }

    sellUom = json["sellUom"];
    altName = json["altName"];
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
      "createdAt": createdAt,
      "modifiedAt": modifiedAt,
      "autoNum": autoNum,
      "autoCode": autoCode,
      "shortName": shortName,
      "itemname": itemname,
      "rate": rate,
      "department": department,
      "tax": tax,
      "cess": cess,
      "inclusive": inclusive,
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
