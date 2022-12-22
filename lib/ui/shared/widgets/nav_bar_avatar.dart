import 'package:flutter/material.dart';

class NavBarAvatar extends StatelessWidget {
  const NavBarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image(
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2017/02/23/13/05/avatar-2092113_1280.png')),
        width: 30,
        height: 30,
      ),
    );
  }
}
