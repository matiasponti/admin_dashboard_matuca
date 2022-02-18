import 'package:admin_dashboard_matuca/services/local_storage.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;

  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    // Peticion http
    _token = 'sdjflksjnsdfklñamnvioqempomñsgk43950';
    print('Almacenar jwt: $_token');

    LocalStorage.prefs.setString('token', _token!);

    /// navigate
    authStatus = AuthStatus.authenticated;
    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    if (LocalStorage.prefs.getString('token') == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // TODO: ir al backend
    await Future.delayed(Duration(seconds: 1));

    authStatus = AuthStatus.authenticated;
    notifyListeners();

    return true;
  }
}
