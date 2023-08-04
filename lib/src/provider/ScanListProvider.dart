// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:qr_scan_flutter/src/Models/ScanModel.dart';
import 'package:qr_scan_flutter/src/provider/DbProvider.dart';

class ScanListprovider extends ChangeNotifier {
  List<ScanModel> scans = [];

  String tipoSeleccionado = 'http';

  nuevoScan(String valor) async {
    final nuevoScan = ScanModel(value: valor);

    final id = await DBProvider.db.newScan(nuevoScan);

    nuevoScan.id = id;
    scans.add(nuevoScan);
    notifyListeners();
  }
}
