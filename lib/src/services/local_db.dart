import 'package:isar/isar.dart';
import 'package:learn_flutter_app/src/model/note.dart';

class LocalDbService{

  late Future<Isar> db;

  LocalDbService(){
    db = openDB(); 
  }

  Future<Isar> openDB() async {
    if(Isar.instanceNames.isEmpty){
      return await Isar.open([], inspector: true, directory: '');
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> saveNote({required Note note}) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.notes.putSync(note));
  }
}