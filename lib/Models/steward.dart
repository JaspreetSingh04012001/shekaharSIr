class Steward {
  String? AutoCode;
  String? Steward_Name;
  String? PHONE;
  String? ADDRESS;
  String? FNAME;
  String? ON_ROLL;
  String? STEW_TYPE;
  String? SELF_SRV;
  Steward.fromJson(Map<String, dynamic> json) {
    AutoCode = json['AutoCode'];
    Steward_Name = json['Steward_Name'];
    PHONE = json['PHONE'];
    ADDRESS = json['ADDRESS'];
    FNAME = json['FNAME'];
    ON_ROLL = json['ON_ROLL'];
    STEW_TYPE = json['STEW_TYPE'];
    SELF_SRV = json['SELF_SRV'];
  }
}
