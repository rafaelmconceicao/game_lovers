
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _dbName = 'games.db';
  static const _version = 1;

  Database? _database;

  Future<Database> openConnection() async {
    var databasesPath = await getDatabasesPath();
    var path = "$databasesPath/$_dbName";
    return await openDatabase(path, version: _version, onCreate: _onCreate);
  }

  Future<Database> getConnection() {
    return Future<Database>.value(_database);
  }

  _onCreate(Database db, int version) async {
    String script =  COMMANDS_CREATE;
    List<String> scripts = script.split(";");
    for (var i = 0; i < scripts.length; i++) {
      String script = scripts.elementAt(i);
      if (script.isNotEmpty) {
        try {
          print(script.trim());
          db.execute(script.trim());
        } on Exception catch (exception) {
          print(exception.toString());
        } catch (error) {
          print(error.toString());
        }
      }
    }
  }

  close() async {
    await _database!.close();
  }


  static const String COMMANDS_CREATE = '''
          CREATE TABLE  games (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            screenshots TEXT ,
            summary TEXT ,
            platform INTEGER,
            category TEXT
            );
            
           CREATE TABLE  genres (
            id INTEGER,
            name TEXT NOT NULL,
            game INTEGER
           );       
        
     
          ''';

}
