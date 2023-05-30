import 'package:flutter/material.dart';
import 'package:notes_app/views/views.dart';

class MainLayoutProvider extends ChangeNotifier {
  double _width = 210;
  Widget _view = const BlankView();
  String _currentView = '';
  bool _openSidebar = true;
  late final TargetPlatform _platform;

  MainLayoutProvider(this._platform);

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

  String get currentView => _currentView;

  set currentView(String value) {
    _currentView = value;
    notifyListeners();
  }

  bool get openSidebar => _openSidebar;

  set openSidebar(bool value) {
    _openSidebar = value;
    notifyListeners();
  }

  TargetPlatform get platform => _platform;
}
