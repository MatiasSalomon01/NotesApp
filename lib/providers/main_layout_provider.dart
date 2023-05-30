import 'package:flutter/material.dart';
import 'package:notes_app/views/views.dart';

class MainLayoutProvider extends ChangeNotifier {
  double _width = 210;
  Widget _view = const BlankView();

  double get width => _width;

  set width(double value) {
    _width = value;
    notifyListeners();
  }

  Widget get view => _view;

  changeViewTo(Widget newView) {
    _view = newView;
    notifyListeners();
  }
}
