import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String _appState = 'Inicializado';

  String get appState => _appState;

  void updateAppState(String newState) {
    _appState = newState;
    notifyListeners();
  }

  void resetAppState() {
    _appState = 'Inicializado';
    notifyListeners();
  }
}
