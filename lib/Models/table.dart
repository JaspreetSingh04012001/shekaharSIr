class Table {
  String? Table_;
  String? Complimentary;
  String? IsGroup;
  String? FFOOD_CTR;
  String? PACKING;
  String? OUTLET_ASSO;
  String? ICON;
  String? SRV_TAX_APP;
  String? TSTG_TBL;
  String? ASSO_STEW_CODE;
  String? TAG;
  dynamic autoCode;
  bool? isOcupied;
  bool? isComplimentary;
  bool? isNormal;
  bool? isFastFood;
  bool? isDelivery;
  bool? isFoodprepairing;

  Table.fromJson(Map<String, dynamic> json) {
    autoCode = json['AutoCode'];
    isOcupied = json['isOcupied'];
    isComplimentary = json['isComplimentary'];
    isNormal = json['isNormal'];
    isFastFood = json['isFastFood'];
    isDelivery = json['isDelivery'];
    isFoodprepairing = json['isFoodprepairing'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['AutoCode'] = autoCode;
    json['isOcupied'] = isOcupied;
    json['isComplimentary'] = isComplimentary;
    json['isNormal'] = isNormal;
    json['isFastFood'] = isFastFood;
    json['isDelivery'] = isDelivery;
    json['isFoodprepairing'] = isFoodprepairing;

    return json;
  }
}
