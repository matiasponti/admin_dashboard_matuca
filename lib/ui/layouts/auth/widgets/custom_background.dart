import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BuildBakcgroundImage(),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 400,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image(
              image: AssetImage('twitter-white-logo.png'),
              width: 400,
            ),
          ),
        ),
      ),
    ));
  }

  BoxDecoration BuildBakcgroundImage() {
    return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'twitter-bg.png',
            ),
            fit: BoxFit.cover));
  }
}
