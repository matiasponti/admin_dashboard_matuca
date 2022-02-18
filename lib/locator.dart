import 'package:admin_dashboard_matuca/providers/auth_provider.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUp() {
  locator.registerLazySingleton<AuthProvider>(() => AuthProvider());
}
