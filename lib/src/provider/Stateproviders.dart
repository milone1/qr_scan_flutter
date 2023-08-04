import 'package:flutter/material.dart';

class StateProvider extends ChangeNotifier {
  int _selectScreen = 0;

  int get selectedScreen {
    return _selectScreen;
  }

  set selectedScreen(int i) {
    _selectScreen = i;
    notifyListeners();
  }
}
