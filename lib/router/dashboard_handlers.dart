import 'package:admin_dashboard_matuca/providers/auth_provider.dart';
import 'package:admin_dashboard_matuca/ui/views/dashboard_view.dart';
import 'package:admin_dashboard_matuca/ui/views/login_view.dart';
import 'package:admin_dashboard_matuca/ui/views/register_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return LoginView();
      } else {
        return DashboardView();
      }
    },
  );
}
