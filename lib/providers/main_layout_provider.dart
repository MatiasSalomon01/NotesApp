import 'package:flutter/material.dart';

class MainLayoutProvider extends ChangeNotifier {
  double _width = 210;

  double get width => _width;

  set width(double value) {
    _width = value;
    notifyListeners();
  }
}
