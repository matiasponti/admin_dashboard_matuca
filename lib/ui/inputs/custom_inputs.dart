import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration authInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hint,
      labelText: label,
      hintStyle: TextStyle(color: Colors.grey),
      labelStyle: TextStyle(color: Colors.grey),
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.white.withOpacity(0.3),
      )),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.white.withOpacity(0.3),
      )),
    );
  }

  static InputDecoration searchInputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey),
      labelStyle: TextStyle(color: Colors.grey),
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
      ),
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
    );
  }
}
