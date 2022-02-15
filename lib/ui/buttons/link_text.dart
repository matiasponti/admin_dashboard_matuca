import 'package:flutter/material.dart';

class LinkText extends StatefulWidget {
  const LinkText({Key? key, required this.text, this.onTap}) : super(key: key);

  final String text;
  final Function? onTap;

  @override
  State<LinkText> createState() => _LinkTextState();
}

bool isHover = false;

class _LinkTextState extends State<LinkText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) widget.onTap!();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHover = !isHover),
        onExit: (_) => setState(() => isHover = !isHover),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                decoration:
                    isHover ? TextDecoration.underline : TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
