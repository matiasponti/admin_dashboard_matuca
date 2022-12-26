import 'package:admin_dashboard_matuca/router/admin_handlers.dart';
import 'package:admin_dashboard_matuca/router/dashboard_handlers.dart';
import 'package:admin_dashboard_matuca/router/no_found_page_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

// Auth Router

  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard router
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank_view';

  static void configureRoutes() {
// Auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);
// router.define(dashboardRoute, handler: );
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
    router.define(blankRoute,
        handler: DashboardHandlers.blankView,
        transitionType: TransitionType.fadeIn);
    router.define(iconsRoute,
        handler: DashboardHandlers.icons,
        transitionType: TransitionType.fadeIn);
// 404

    router.notFoundHandler = NoPageFoundHandlers.noFoundPage;
  }
}
