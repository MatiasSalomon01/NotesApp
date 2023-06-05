import 'package:flutter/material.dart';

class Routes {
  static const String todo = 'todo';
  static const String notes = 'notes';
  static const String homework = 'homework';
  static const String toRemember = 'toRemember';
}

class Constants {
  static const String baseUrl = "notesapp-4ebee-default-rtdb.firebaseio.com";
  static final String currentDate =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';

  static EdgeInsetsGeometry? setHeaderPlatformPadding(
      TargetPlatform platform, double safeArea, Size size) {
    if (platform == TargetPlatform.android || platform == TargetPlatform.iOS) {
      return EdgeInsets.only(top: safeArea);
    } else {
      return null;
    }
  }

  static double? setHeaderPlatformHeight(TargetPlatform platform) {
    if (platform == TargetPlatform.android || platform == TargetPlatform.iOS) {
      return null;
    } else {
      return 55;
    }
  }
}
