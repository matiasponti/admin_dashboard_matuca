import 'package:admin_dashboard_matuca/locator.dart';
import 'package:admin_dashboard_matuca/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  final _authProvider = locator.get<AuthProvider>();

  validateForm() {
    if (formKey.currentState!.validate()) {
      _authProvider.login(email, password);
    } else {}
  }
}
