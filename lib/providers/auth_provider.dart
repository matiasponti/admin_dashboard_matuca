import 'package:admin_dashboard_matuca/api/backend_api.dart';
import 'package:admin_dashboard_matuca/models/http/auth_response.dart';
import 'package:admin_dashboard_matuca/router/router.dart';
import 'package:admin_dashboard_matuca/services/local_storage.dart';
import 'package:admin_dashboard_matuca/services/navigation_service.dart';
import 'package:admin_dashboard_matuca/services/notifications_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  Usuario? user;

  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    // Peticion http

    LocalStorage.prefs.setString('token', _token!);

    /// navigate
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  register(String email, String password, String name) {
    final data = {"nombre": name, "correo": email, "password": password};

    BackendApi.post('/usuarios', data).then((json) {
      print(json);

      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      final token = LocalStorage.prefs.getString('token');
      print(token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      notifyListeners();
    }).catchError((e) {
      NotificaitonService.showSnackBarError('Cuenta ya existente');
    });
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
