import 'package:flutter/material.dart';

class NotificationIndicator extends StatelessWidget {
  const NotificationIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Icon(
          Icons.notifications_none_outlined,
          color: Colors.grey,
        ),
        Positioned(
          left: 5,
          child: Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.red,
            ),
          ),
        )
      ]),
    );
  }
}
