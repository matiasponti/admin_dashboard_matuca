import 'package:admin_dashboard_matuca/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu_book_outlined)),
          SizedBox(
            width: 5,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250),
            child: SearchText(),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
