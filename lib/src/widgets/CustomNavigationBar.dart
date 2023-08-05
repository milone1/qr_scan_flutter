// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_flutter/src/provider/Stateprovider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    final stateProvider = Provider.of<StateProvider>(context);
    final currentIndex = stateProvider.selectedScreen;
    return BottomNavigationBar(
        onTap: (int i) => stateProvider.selectedScreen = i,
        currentIndex: currentIndex,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Maps'),
          BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration), label: 'Direcction'),
        ]);
  }
}
