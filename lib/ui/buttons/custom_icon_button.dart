import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.colors = Colors.indigo,
      this.isFilled = false,
      required this.icon})
      : super(key: key);

  final Function onPressed;
  final String text;
  final Color colors;
  final bool isFilled;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            ),
            backgroundColor: MaterialStateProperty.all(colors.withOpacity(0.5)),
            overlayColor: MaterialStateProperty.all(colors.withOpacity(0.3))),
        onPressed: () => onPressed(),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white),
            )
          ],
        ));
  }
}
