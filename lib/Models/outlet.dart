import 'package:admin/Models/steward.dart';
import 'package:admin/Models/table.dart';

class Outlet {
  String? AutoCode;
  String? uniqueId;
  String? outletName;
  bool? bar;
  bool? discontinue;
  String? KITCHEN;

  String? outletStartDate;
  List<Steward>? activeStewards;
  List<Table>? tables;
  List<String>? departements;
  List<String>? categories;

  Outlet.fromJson(Map<String, dynamic> json) {
    print(json);
    AutoCode = json['AutoCode'];
    uniqueId = json['uniqueId'];
    outletName = json['outletName'];
    bar = json['bar'];
    discontinue = json['discontinue'];
    KITCHEN = json['KITCHEN'];
    outletStartDate = json['outletStartDate'];

    if (json['activeStewards'] != null) {
      activeStewards = [];

      json['activeStewards'].forEach((element) {
        if (element != null) {
          activeStewards!.add(Steward.fromJson(element));
        }
      });
    }
    if (json['tables'] != null) {
      tables = [];
      json['tables'].forEach((element) {
        if (element != null) {
          tables!.add(Table.fromJson(element));
        }
      });
    }
    departements = json['departements'];

    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((element) {
        if (element != null) {
          categories!.add(element);
        }
      });
    }
    // categories = json['categories'];
    // tables?.forEach((element) {
    //   print(element.toJson());
    // });
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['AutoCode'] = AutoCode;
    json['uniqueId'] = uniqueId;
    json['outletName'] = outletName;
    json['bar'] = bar;
    json['discontinue'] = discontinue;
    json['KITCHEN'] = KITCHEN;
    json['outletStartDate'] = outletStartDate;
    if (activeStewards != null) {
      json['activeStewards'] = activeStewards!.map((e) => e.tojson()).toList();
    }
    if (tables != null) {
      json['tables'] = tables!.map((e) => e.toJson()).toList();
    }
    // json['tables']= tables.forEach((element) {element.toJson();}) ;
    json['departements'] = departements;
    json['categories'] = categories;
    return json;
  }
}
