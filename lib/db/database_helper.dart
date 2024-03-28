import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance =  DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if ( _database != null ) return _database! ;

    _database = await _initDatabase();
    return _database! ;
  }

  Future<Database> _initDatabase() async {
    var documentDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentDirectory.path,'lib/db/quiz_database.db');
    return await openDatabase(path, version: 1,onCreate: _createDatabase);
  }
//Table creation in database
  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY,
      username TEXT,
      f_name TEXT,
      l_name TEXT,
      email TEXT,
      password TEXT
    )
''');

    await db.execute('''
      CREATE TABLE scores (
        id INTEGER PRIMARY KEY,
        userID INTEGER,
        score INTEGER,
        date TEXT,
        FOREIGN KEY(userId) REFERENCES users(id)
      )
 ''');
  }
//user insertion in database
  Future<int> insertUser(Map<String,dynamic> user) async{
    Database db = await instance.database;
    return await db.insert('users',user);
  }
//score insertion in database
  Future<int> insertScore(Map<String,dynamic> score) async {
    Database db = await instance.database;
    return await db.insert('scores',score);
  }

  Future<List<Map<String,dynamic>>> getUserScores(int userId) async {
    Database db = await instance.database;
    return db.query('scores',where: 'userId = ?',whereArgs: [userId]);
  }

}