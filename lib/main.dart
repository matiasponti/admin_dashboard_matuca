import 'package:admin_dashboard_matuca/api/backend_api.dart';
import 'package:admin_dashboard_matuca/locator.dart';
import 'package:admin_dashboard_matuca/providers/auth_provider.dart';
import 'package:admin_dashboard_matuca/providers/categories_provider.dart';
import 'package:admin_dashboard_matuca/providers/side_menu_provider.dart';
import 'package:admin_dashboard_matuca/router/router.dart';
import 'package:admin_dashboard_matuca/services/local_storage.dart';
import 'package:admin_dashboard_matuca/services/navigation_service.dart';
import 'package:admin_dashboard_matuca/services/notifications_service.dart';
import 'package:admin_dashboard_matuca/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard_matuca/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_dashboard_matuca/ui/layouts/splash_layout/splash_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocalStorage.configurePrefs();
  BackendApi.configureDio();
  setUp();
  Flurorouter.configureRoutes();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard Matuca',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationService.messengerKey,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking)
          return SplashLayout();

        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      },
      theme: ThemeData.light().copyWith(
          scrollbarTheme: ScrollbarThemeData().copyWith(
              thumbColor:
                  MaterialStateProperty.all(Colors.grey.withOpacity(0.5)))),
    );
  }
}
