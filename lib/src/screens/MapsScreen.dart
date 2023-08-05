// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:qr_scan_flutter/src/Models/ScanModel.dart';
import 'package:qr_scan_flutter/src/widgets/ScanTiles.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(type: ScanType.geo, icon: Icons.location_pin);
  }
}
