import 'package:news_app/repo/core/constants.dart';
import 'package:news_app/src/models/item_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class DbProvider{
Database db;
DbProvider(){
  init();
}
init() async {
  Directory directory = await getApplicationDocumentsDirectory();
  String path = join(directory.path, DB_NAME);

  db = await openDatabase(
    path,
   version: 1,
   onCreate: (Database database, int version){
     Batch batch = database.batch();
     batch.execute("""
     CREATE TABLE Items
     (
       id INTEGER PRIMARY KEY,
       by TEXT,
       descendants INTEGER,
       score INTEGER,
       text TEXT,
       time INTEGER,
       title TEXT,
       type TEXT,
       kids BLOB,
       deleted INTEGER,
       dead INTEGER,
       parent INTEGER
     )

     """);
     batch.commit();
   },
   );
}

insertItem(ItemModel itemModel){
db.insert('items', itemModel.toJson(),
conflictAlgorithm: ConflictAlgorithm.replace,
);
}
fetchItem(int id)async{
  //select * from items where id = :id
 final data = await db.query
 (
   'Items',
  columns: ['*'],
  where: "id = ?",
  whereArgs: [id],
  );
  if(data== null){
    return null;
  }
  return ItemModel.fromDb(data.first);
}

}