import 'package:admin/Models/captain.dart';
import 'package:get/get.dart';

class CaptainController extends GetxController {

 Captain? selectedCapatin ;
 void setSelectedCapatin(Captain cap){
   selectedCapatin = cap;
   update();
 }
}