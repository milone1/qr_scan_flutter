import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan_flutter/src/provider/Stateproviders.dart';
import 'package:qr_scan_flutter/src/screens/DirectionScreen.dart';
import 'package:qr_scan_flutter/src/screens/MapScreen.dart';
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    // get selectScren
    final stateProvider = Provider.of<StateProvider>(context);
    final currentIndex = stateProvider.selectedScreen;

    switch (currentIndex) {
      case 0:
        return MapScreen();
      case 1:
        return const DirectionScreen();
      default:
        return MapScreen();
    }
  }
}
