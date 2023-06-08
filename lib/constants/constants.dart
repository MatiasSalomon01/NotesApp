import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/services/services.dart';

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
      return 95;
    } else {
      return 55;
    }
  }
}

class Utility {
  static void copyToClipboard(String descripcion) {
    Clipboard.setData(ClipboardData(text: descripcion));
    NotificationService.showSnackbar(
      'Copiado al portapapeles',
      Colors.green,
      Icons.info_outline,
    );
  }
}
