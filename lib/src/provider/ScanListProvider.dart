// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:qr_scan_flutter/src/Models/ScanModel.dart';
import 'package:qr_scan_flutter/src/provider/DbProvider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];

  late ScanType typeSelected;

  Future<ScanModel> newScan(String valor, ScanType type) async {
    final newScan = ScanModel(value: valor, type: type);

    final id = await DBProvider.db.newScan(newScan);

    newScan.id = id;

    if (typeSelected == newScan.type) {
      scans.add(newScan);
      notifyListeners();
    }

    return newScan;
  }

  loadList() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans];
    notifyListeners();
  }

  loadListByType(ScanType type) async {
    final scans = await DBProvider.db.getScansType(type);
    this.scans = [...scans];
    typeSelected = type;
    notifyListeners();
  }

  deleteOne(int id) async {
    await DBProvider.db.deleteScan(id);
    loadListByType(typeSelected);
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAllScans();
    scans = [];
    notifyListeners();
  }
}
