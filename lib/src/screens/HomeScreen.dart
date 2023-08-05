// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_flutter/src/Models/ScanModel.dart';
import 'package:qr_scan_flutter/src/provider/ScanListProvider.dart';
import 'package:qr_scan_flutter/src/provider/Stateprovider.dart';
import 'package:qr_scan_flutter/src/screens/DirectionScreen.dart';
import 'package:qr_scan_flutter/src/screens/MapsScreen.dart';
import 'package:qr_scan_flutter/src/widgets/CustomFloatingButton.dart';
import 'package:qr_scan_flutter/src/widgets/CustomNavigationBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<ScanListProvider>(context, listen: false)
                    .deleteAllScans();
              },
              icon: const Icon(Icons.delete_outline_outlined))
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    // get selectScren
    final stateProvider = Provider.of<StateProvider>(context);
    final currentIndex = stateProvider.selectedScreen;
    // riding databse
    // final tempScan = new ScanModel(value: 'wwww.google.com');
    // DBProvider.db.newScan(tempScan);

    final scanList = Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanList.loadListByType(ScanType.geo);
        return const MapsScreen();
      case 1:
        scanList.loadListByType(ScanType.https);
        return const DirectionScreen();
      default:
        return const MapsScreen();
    }
  }
}
