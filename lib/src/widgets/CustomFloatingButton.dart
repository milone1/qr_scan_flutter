// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        const barcodeScanRes = "https://briefcase-erickmilan.vercel.app";
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
