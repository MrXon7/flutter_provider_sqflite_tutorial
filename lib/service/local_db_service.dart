import 'package:project1/lesson3/data/model/mind_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDb {
  Database? db;
  String tableName = "minds";

  LocalDb();

  Future<Database> getDb() async {
    if (db == null) {
      db = await createDatabase();
      return db!;
    }
    return db!;
  }

  createDatabase() async {
    print("DB haraktga kelmoqda");
    String databasePath = await getDatabasesPath();
    String dbPath = '${databasePath}minds.db';
    print("Db manzili $dbPath");
    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    print("Db ochildi");
    print("db ochiqmi ${database.isOpen}");
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE $tableName("
        // "id INTEGER PRIMARY KEY,"
        "mind TEXT,"
        "author TEXT"
        // "createdAt TEXT"
        ")");
  }

  // Database ga ma'lumot qo'shish
  Future addMind(MindModel mind) async {
    Database db = await getDb();
    var id = await db.insert(tableName, mind.toJson());
    print("Mind $id bilan saqlandi");
  }

  // DB malumotlarini oladi
  Future<List> getMind() async {
    Database db = await getDb();
    var result = await db.query(tableName, columns: ["mind", "author"]);

    return result.toList();
  }

  // DB ni yangilash
  Future updateMind(MindModel mindModel, String mind) async {
    Database db = await getDb();
    var id = await db.update(tableName, mindModel.toJson(),
        where: 'mind=?', whereArgs: [mind]);
    print("Update boldi");
  }

  // DB elementini o'chirish
  Future deleteMind(String mind) async {
    Database db = await getDb();
    await db.delete(tableName, where: 'mind=?', whereArgs: [mind]);
    print("Deleted");
  }
}
