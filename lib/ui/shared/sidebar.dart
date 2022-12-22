import 'package:admin_dashboard_matuca/providers/side_menu_provider.dart';
import 'package:admin_dashboard_matuca/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard_matuca/ui/shared/widgets/menu_item.dart'
    as widget;
import 'package:admin_dashboard_matuca/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(
            height: 50,
          ),
          TextSeparator(text: 'Main'),
          widget.MenuItem(
              text: 'Dashboard',
              onPressed: () {
                SideMenuProvider.closeMenu();
              },
              icon: Icons.compass_calibration_outlined),
          widget.MenuItem(
              text: 'Orders',
              onPressed: () {},
              icon: Icons.shopping_cart_outlined),
          widget.MenuItem(
              text: 'Analytics',
              onPressed: () {},
              icon: Icons.graphic_eq_outlined),
          widget.MenuItem(
              text: 'Categories',
              onPressed: () {},
              icon: Icons.layers_outlined),
          widget.MenuItem(
              text: 'Products',
              onPressed: () {},
              icon: Icons.dashboard_outlined),
          widget.MenuItem(
              text: 'Discounts',
              onPressed: () {},
              icon: Icons.attach_money_outlined),
          widget.MenuItem(
              text: 'Customers',
              onPressed: () {},
              icon: Icons.people_alt_outlined),
          SizedBox(
            height: 30,
          ),
          TextSeparator(text: 'Ui Elements'),
          widget.MenuItem(
              text: 'Icons', onPressed: () {}, icon: Icons.list_alt_outlined),
          widget.MenuItem(
              text: 'Marketing',
              onPressed: () {},
              icon: Icons.mark_email_read_outlined),
          widget.MenuItem(
              text: 'Campaign',
              onPressed: () {},
              icon: Icons.note_add_outlined),
          widget.MenuItem(
              text: 'Blank page',
              onPressed: () {},
              icon: Icons.post_add_outlined),
          widget.MenuItem(
              text: 'Logout',
              onPressed: () {},
              icon: Icons.exit_to_app_outlined),
        ],
      ),
    );
  }

  BoxDecoration buildDecoration() => const BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0xff092044),
        Color(0xff092042),
      ]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
