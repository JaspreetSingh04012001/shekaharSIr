
import 'package:get/get.dart';

import '../Models/steward.dart';

class StewardController extends GetxController {

 Steward? selectedCapatin ;
 void setSelectedCapatin(Steward cap){
   selectedCapatin = cap;
   update();
 }
}