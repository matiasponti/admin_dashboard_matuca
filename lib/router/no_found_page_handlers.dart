import 'package:admin_dashboard_matuca/providers/side_menu_provider.dart';
import 'package:admin_dashboard_matuca/ui/views/no_found_page_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class NoPageFoundHandlers {
  static Handler noFoundPage = Handler(
    handlerFunc: (context, parameters) {
      Provider.of<SideMenuProvider>(context!, listen: false)
          .setCurrentPageUrl('/404');
      return NoFoundPageView();
    },
  );
}
