import 'package:sqflite/sqflite.dart';
import 'package:task2/model/userModel.dart';

class DatabaseHelper {
  static final _databaseName = "myDatabase3.db";
  static final _databaseVersion = 1;

  static final table = 'my_table';

  static final columnId = '_id';
  static final columnEmail = '_email';
  static final columnPassword = '_password';
  static Future<Database> getDatabase() async {
    return await openDatabase(
      _databaseName,
      version: _databaseVersion,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE $table ($columnId INTEGER PRIMARY KEY, $columnEmail TEXT, $columnPassword TEXT)');
      },
    );
  }

  static Future<void> addRowToDataBase(UserModel userModel) async {
    Database database = await getDatabase();
    await database.transaction(
      (txn) async {
        await txn.rawInsert(
            'INSERT INTO $table ($columnEmail, $columnPassword) VALUES("${userModel.email}" , "${userModel.password}")');
      },
    );
  }

  static Future<List<UserModel>> cheakUserDatabase(UserModel userModel) async {
    return getDatabase().then((database) async {
      List<Map> list = await database.rawQuery('SELECT * FROM $table');
      if (list.isEmpty) return [];
      List<UserModel> li = [];
      list.forEach((e) {
        if (e[columnEmail] == userModel.email)
          li.add(UserModel(
            id: e[columnId],
            email: e[columnEmail],
            password: e[columnPassword],
          ));
      });
      return li;
    });
  }

  static Future<List<UserModel>> cheakUsernameAndPasswordDatabase(
      UserModel userModel) async {
    return getDatabase().then((database) async {
      List<Map> list = await database.rawQuery('SELECT * FROM $table');
      if (list.isEmpty) return [];
      List<UserModel> li = [];
      list.forEach((e) {
        if (e[columnEmail] == userModel.email &&
            userModel.password == e[columnPassword])
          li.add(UserModel(
            id: e[columnId],
            email: e[columnEmail],
            password: e[columnPassword],
          ));
      });
      return li;
    });
  }

  static Future<UserModel> getDataById(id) async {
    return getDatabase().then((database) async {
      List<Map> list = await database.rawQuery('SELECT * FROM $table');
      if (list.isEmpty)
        return UserModel(id: -1, email: 'email', password: 'password');
      List<UserModel> li = [];
      list.forEach((e) {
        if (e[columnId] == id)
          li.add(UserModel(
            id: e[columnId],
            email: e[columnEmail],
            password: e[columnPassword],
          ));
      });
      return li[0];
    });
  }
}
