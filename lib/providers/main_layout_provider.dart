import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/views/views.dart';

class MainLayoutProvider extends ChangeNotifier {
  double _width = 210;
  Widget _view = const TodoView();
  String _currentView = Routes.todo;
  bool _openSidebar = false;
  late final TargetPlatform _platform;
  String _addActionName = "Tarea";

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

  String get addActionName => _addActionName;

  set addActionName(String value) {
    _addActionName = value;
    notifyListeners();
  }

  TargetPlatform get platform => _platform;
}
