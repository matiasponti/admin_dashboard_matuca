import 'package:flutter/material.dart';

class NotificationService {
  static late GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBarError(String message) {
    final snackBar = new SnackBar(
        backgroundColor: Colors.red.withOpacity(0.9),
        content: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ));

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showSnackBarDone(String message) {
    final snackBar = new SnackBar(
        backgroundColor: Colors.green.withOpacity(0.9),
        content: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ));

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
