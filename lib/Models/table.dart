class Table {
  String? Autocode;
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

  bool? isOcupied;
  bool? isComplimentary;
  bool? isNormal;
  bool? isFastFood;
  bool? isDelivery;
  bool? isFoodprepairing;

  Table.fromJson(Map<String, dynamic> json){
isOcupied = json['isOcupied'];
isComplimentary = json['isComplimentary'];
isNormal = json['isNormal'];
isFastFood = json['isFastFood'];
isDelivery = json['isDelivery'];
isFoodprepairing = json['isFoodprepairing'];

  }

}
