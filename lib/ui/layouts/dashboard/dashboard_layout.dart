import 'package:admin_dashboard_matuca/providers/side_menu_provider.dart';
import 'package:admin_dashboard_matuca/ui/shared/navbar.dart';
import 'package:admin_dashboard_matuca/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SideMenuProvider.menuController = new AnimationController(
        vsync: this, duration: Duration(microseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffEDF1F2),
        body: Stack(
          children: [
            Row(
              children: [
                if (size.width > 600) SideBar(),
                Expanded(
                  child: Column(
                    children: [
                      NavBar(),
                      Expanded(
                          child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: widget.child,
                      )),
                    ],
                  ),
                ),
              ],
            ),
            if (size.width < 700)
              AnimatedBuilder(
                  animation: SideMenuProvider.menuController,
                  builder: (context, _) => Stack(
                        children: [
                          if (SideMenuProvider.isOpen)
                            AnimatedOpacity(
                              opacity: SideMenuProvider.opacity.value,
                              duration: Duration(milliseconds: 200),
                              child: GestureDetector(
                                onTap: () => SideMenuProvider.closeMenu(),
                                child: Container(
                                    width: size.width,
                                    height: size.height,
                                    color: Colors.black26),
                              ),
                            ),

                          // TODO: background
                          Transform.translate(
                            offset: Offset(SideMenuProvider.movement.value, 0),
                            child: SideBar(),
                          )
                        ],
                      ))
          ],
        ));
  }
}
