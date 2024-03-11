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
    final data = {"correo": email, "password": password};
    // Peticion http
    BackendApi.post('/auth/login', data).then((json) {
      print(json);

      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;
      LocalStorage.prefs.setString('token', authResponse.token);
      authStatus = AuthStatus.authenticated;
      final token = LocalStorage.prefs.getString('token');
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      BackendApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      NotificationService.showSnackBarError('Usuario o cotraseña incorrectos');
    });
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
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      BackendApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      NotificationService.showSnackBarError('Cuenta ya existente');
    });
  }

  Future<bool> isAuthenticated() async {
    if (LocalStorage.prefs.getString('token') == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    try {
      final response = await BackendApi.httpGet("/auth");
      final authResponse = AuthResponse.fromMap(response);
      LocalStorage.prefs.setString('token', authResponse.token);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
