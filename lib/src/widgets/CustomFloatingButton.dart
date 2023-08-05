// ignore_for_file: file_names, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_flutter/src/Models/ScanModel.dart';
import 'package:qr_scan_flutter/src/provider/ScanListProvider.dart';
import 'package:qr_scan_flutter/src/utils/utils.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);

        if (barcodeScanRes == '-1') {
          return;
        }
        // String barcodeScanRes = "geo:-11.277187,-73.699700";
        List<String> parteInicial = barcodeScanRes.split(":");
        ScanModel newScan;
        // const barcodeScanRes = "https://pub.dev/packages/url_launcher";

        final scanList = Provider.of<ScanListProvider>(context, listen: false);
        if (parteInicial[0] == 'https') {
          newScan = await scanList.newScan(barcodeScanRes, ScanType.https);
        } else {
          newScan = await scanList.newScan(barcodeScanRes, ScanType.geo);
        }

        Utils().canLaunchUrl(
            Uri.parse(newScan.value), newScan.type, context, newScan);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
