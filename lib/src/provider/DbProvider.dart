// ignore_for_file: depend_on_referenced_packages, file_names

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qr_scan_flutter/src/Models/ScanModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async {
    // path of tha database
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'ScansDB.db');
    print('path: ' + path);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(''' CREATE TABLE Scans(
        id integer primary key,
        type TEXT,
        value TEXT
      ) ''');
    });
  }

  // newScanRaw(ScanModel scan) async {
  //   final id = scan.id;
  //   final type = scan.type;
  //   final value = scan.value;

  //   final db = await database;

  //   final res = await db.rawInsert(
  //       '''  INSERT INTO Scans(id, type, value) values ($id,'$type', '$value')   ''');

  //   return res;
  // }

  newScan(ScanModel scan) async {
    final db = await database;
    final res = await db.insert('Scans', scan.toJson());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final res = await db.query('Scans');

    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<List<ScanModel>> getScansType(ScanType type) async {
    final db = await database;
    final typeString = type.toString();

    final res = await db.query('Scans',
        where: 'type = ?', whereArgs: [typeString.split('.').last]);

    return res.isNotEmpty ? res.map((e) => ScanModel.fromJson(e)).toList() : [];
  }

  Future<int> updateScan(ScanModel scan) async {
    final db = await database;
    final res = await db
        .update('Scans', scan.toJson(), where: 'id = ?', whereArgs: [scan.id]);

    return res;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllScans() async {
    final db = await database;
    final res = await db.rawDelete(''' 
    delete from Scans
    ''');
    return res;
  }
}
