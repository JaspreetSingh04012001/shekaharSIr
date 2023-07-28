class Steward {
  String? AutoCode;
  String? id;
  String? Steward_Name;
  String? PHONE;
  String? ADDRESS;
  String? FNAME;
  String? ON_ROLL;
  String? STEW_TYPE;
  String? SELF_SRV;
  Steward.fromJson(Map<String, dynamic> json) {
    // print("cdcdcd");
    id = json["id"].toString();
    AutoCode = json['AutoCode'];
    Steward_Name = json['Steward_Name'];
    PHONE = json['PHONE'];
    ADDRESS = json['ADDRESS'];
    FNAME = json['FNAME'];
    ON_ROLL = json['ON_ROLL'];
    STEW_TYPE = json['STEW_TYPE'];
    SELF_SRV = json['SELF_SRV'];
  }

  tojson() {
     Map<String, dynamic> json = <String, dynamic>{};
    json["id"] = id;
    json['AutoCode'] = AutoCode;
    json['Steward_Name'] = Steward_Name;
    json['PHONE'] = PHONE;
    json['ADDRESS'] = ADDRESS;
    json['FNAME'] = FNAME;
    json['ON_ROLL'] = ON_ROLL;
    json['STEW_TYPE'] = STEW_TYPE;
    json['SELF_SRV'] = SELF_SRV;
    return json;
  }
}
