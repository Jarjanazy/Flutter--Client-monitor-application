import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'Client.dart';

class DBClient {

  // private constructor
  DBClient._();
  // create a sinlge instance of the this class, implementing the singelton pattern
  static final DBClient myDB = DBClient._();

  Database _database;

  Future<Database> get database async{
    if(_database != null){
      return _database;
    }
    _database = await initDB();
    return _database;

  }
  
  initDB() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, "ClientDB.db");

    return await openDatabase(
    path, 
    version: 1, 
    onOpen: (db) {}, 
    onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Client ("
          "id INTEGER PRIMARY KEY,"
          "first_name TEXT,"
          "last_name TEXT"
          ")");
    });
  }

  newClient (Client newClient) async{
    final db = await database;
    var res = await db.insert("Client", newClient.toJson());
    return res;
  }

  getClient(int id) async {
    final db = await database;
    var res =await  db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromMappedJson(res.first) : Null ;
  }

  updateClient(Client newClient) async {
    final db = await database;
    var res = await db.update("Client", newClient.toJson(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }

  deleteClient(int id) async {
    final db = await database;
    db.delete("Client", where: "id = ?", whereArgs: [id]);
  }

  getAllClients() async{
    final db = await database;
    var res = await db.query("Client");
    return res;
  }

}