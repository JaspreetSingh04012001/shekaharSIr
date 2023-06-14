import 'package:get_storage/get_storage.dart';

class Stroge {
  final box = GetStorage();
  //box.write('quote', 'GetX is the best');
  //box.read('quote');
  //box.remove('quote');
  /*
  box.listenKey('key', (value){
  print('new key is $value');
   });
  */
//Add item in  menu
// SName : 11 item : Pav bhaji RATE : 10 Qtx : -17 FG : F
 Future<List> menuFromStorage() async {
    var data = box.read("OutletID");
    if (data is List) {
     return data;
      }
      else {
        return [];}
      }

  addItemMenu({required Map item}) {
    print(item);
    var data = box.read("OutletID");
    //print(data);
    if (data == null) {
      box.write("OutletID", [item]);
    } else {
      data.add(item);
      box.write("OutletID", data);
    }
  }
}
