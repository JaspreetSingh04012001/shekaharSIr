
import 'package:admin/Models/steward.dart';
import 'package:admin/Models/table.dart';

class Outlet {
  String? AutoCode;
  String? outletName;
  bool? bar;
  bool? discontinue;
  String? KITCHEN;

  DateTime? outletStartDate;
  List<Steward>? activeStewards;
  List<Table>? tables;

  Outlet.fromJson(Map<String, dynamic> json) {
    AutoCode = json['AutoCode'];
    outletName = json['outletName'];
    bar = json['bar'];
    discontinue = json['discontinue'];
    KITCHEN = json['KITCHEN'];
    outletStartDate = json['outletStartDate'];
    activeStewards = json['activeStewards'];
    tables = json['tables'];

  }
  //  Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['price'] = price;
  //   data['discounted_price'] = discountedPrice;
  //   if (variation != null) {
  //     data['variation'] = variation?.map((v) => v.toJson()).toList();
  //   }

  //   data['discount_amount'] = discountAmount;
  //   data['quantity'] = quantity;
  //   data['tax_amount'] = taxAmount;
  //   if (addOnIds != null) {
  //     data['add_on_ids'] = addOnIds?.map((v) => v.toJson()).toList();
  //   }
  //   data['variations'] = variations;
  //   data['product'] = product?.toJson();
  //   return data;
  // }
}
