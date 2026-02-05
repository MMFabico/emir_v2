import '../models/farm.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyFarmDatabase {

  static final MyFarmDatabase instance = MyFarmDatabase._init();
  static Database? _database;

  MyFarmDatabase._init();

  // retrieve database from local sqflite
  Future<Database> get database async {
    if (_database != null) return _database!; // if it's not empty, return the database that was retrieved
    _database = await _initDB('myFarm.db');
    return _database!;
  }

  // initialize the database
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // create the database table
  Future _createDB(Database db, int version) async {

    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const integerType = 'INTEGER NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const dateTimeType = 'TEXT NOT NULL';

    await db.execute('''

      CREATE TABLE $tableFarms ( 
        ${MyFarmFields.id} $idType, 
        ${MyFarmFields.isImportant} $boolType,
        ${MyFarmFields.number} $integerType,
        ${MyFarmFields.name} $textType,
        ${MyFarmFields.description} $textType,
        ${MyFarmFields.time} $dateTimeType,
        ${MyFarmFields.cropType} $textType
        )

    ''');
  }

  // create a new farm
  Future<Farm> createFarm(Farm farm) async {
    final db = await instance.database;
    final id = await db.insert(tableFarms, farm.toJson());
    return farm.copy(id: id);
  }

  // retrieve a farm based on id
  Future<Farm> viewFarm(String id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableFarms,
      columns: MyFarmFields.values,
      where: '${MyFarmFields.id} = ?',
      whereArgs: [id],
    );

    // throws an exception if the id is not found
    if (maps.isNotEmpty) {
      return Farm.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  // retrieve all farms in a list
  Future<List<Farm>> allFarm() async {
    final db = await instance.database;
    final orderBy = '${MyFarmFields.time} ASC'; // sort by time created ascending
    final result = await db.query(
      tableFarms,
      orderBy: orderBy,
    );
    return result.map((json) => Farm.fromJson(json)).toList();
  }

  // update a farm
  Future<int> update(Farm farm) async {
    final db = await instance.database;
    return db.update(
      tableFarms,
      farm.toJson(),
      where: '${MyFarmFields.id} = ?',
      whereArgs: [farm.id],
    );
  }

  // delete a farm
  Future<int> delete(String id) async {
    final db = await instance.database;
    return db.delete(
      tableFarms,
      where: '${MyFarmFields.id} = ?',
      whereArgs: [id],
    );
  }

  // close the database
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
