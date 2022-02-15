import 'package:admin_dashboard_matuca/ui/views/no_found_page_view.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandlers {
  static Handler noFoundPage = Handler(
    handlerFunc: (context, parameters) {
      return NoFoundPageView();
    },
  );
}
