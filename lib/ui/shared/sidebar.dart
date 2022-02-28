import 'package:admin_dashboard_matuca/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard_matuca/ui/shared/widgets/menu_item.dart';
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
          MenuItem(
              text: 'Dashboard',
              onPressed: () {},
              icon: Icons.compass_calibration_outlined)
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
