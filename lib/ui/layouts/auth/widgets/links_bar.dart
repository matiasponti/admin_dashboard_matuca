import 'package:admin_dashboard_matuca/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      height: size.width > 1000 ? size.height * 0.1 : null,
      child: Container(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            LinkText(
              text: 'About',
            ),
            LinkText(
              text: 'Help Center',
            ),
            LinkText(
              text: 'Terms of Service',
            ),
            LinkText(
              text: 'Privacy policy',
            ),
            LinkText(
              text: 'Cookie policy',
            ),
            LinkText(
              text: 'Ads info',
            ),
            LinkText(
              text: 'Blog',
            ),
            LinkText(
              text: 'Status',
            ),
            LinkText(
              text: 'Carrers',
            ),
            LinkText(
              text: 'Resources',
            ),
            LinkText(
              text: 'Advertising',
            ),
            LinkText(
              text: 'Marketing',
            ),
          ],
        ),
      ),
    );
  }
}
