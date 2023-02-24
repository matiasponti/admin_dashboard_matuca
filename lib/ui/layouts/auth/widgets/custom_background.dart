import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BuildBakcgroundImage(),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 400,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Budget planning project',
              style: GoogleFonts.montserratAlternates(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration BuildBakcgroundImage() {
    return const BoxDecoration(color: Colors.deepOrangeAccent);
  }
}
