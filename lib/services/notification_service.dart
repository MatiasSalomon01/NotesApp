import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String messege, Color color) {
    final snackBar = SnackBar(
      duration: const Duration(milliseconds: 1500),
      backgroundColor: color,
      content: Text(
        messege,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}