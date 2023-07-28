class ItemVariation {
  ItemVariation({this.variationName, this.rate, this.qty});
  String? variationName;
  String? rate;
  double? qty;

  ItemVariation.fromjson(Map<String , dynamic> json){
    variationName = json["variationName"];
    rate = json["rate"];
    qty = json["qty"];
  }
  tojson(){
    Map<String , dynamic> data ={
      "variationName" : variationName,
      "rate" : rate,
      "qty" : qty,
    };
    return data;
  }
}
