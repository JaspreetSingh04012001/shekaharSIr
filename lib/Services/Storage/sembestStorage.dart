import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart' as path;
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DbController extends GetxController {
  final authbox = GetStorage('Authentication');
   
   init(){  
    
   }


}
// late final databasePath;
// late final databaseFactory;
// late final database;
// late final store;

//   init() async {
//     databasePath = path.join("your_database.db");
//     databaseFactory = databaseFactoryIo;
//     database =  databaseFactory.openDatabase(databasePath);
//     store =  intMapStoreFactory.store("your_store");
//   }

//  Create
//   Future<void> create(Map<String, dynamic> data) async {
//     await store.add(database, data);
//   }

//  Read
//   Future<List<RecordSnapshot<int, Map<String, dynamic>>>> readAll() async {
//     final finder = Finder(sortOrders: [SortOrder(Field.key)]);
//     final records = await store.find(database, finder: finder);
//     return records;
//   }

// update

//   updateStore(int id, Map<String, dynamic> newData) async {
//     final finder = Finder(filter: Filter.byKey(id));
//     await store.update(database, newData, finder: finder);
//   }

//  Delete
//   Future<void> delete(int id) async {
//     final finder = Finder(filter: Filter.byKey(id));
//     await store.delete(database, finder: finder);
//   }

// 

//   Stream<List<RecordSnapshot<int, Map<String, dynamic>>>> listenDb() {
//     final snapshots = store.query();
//     return snapshots.onSnapshots(database);
//   }