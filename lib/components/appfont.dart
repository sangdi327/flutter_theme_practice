import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appfont extends StatelessWidget {
  const Appfont(
    this.text, {
    super.key,
    this.color,
    this.size = 24,
    this.lineHeight,
    this.letterSpacing,
    this.fontWeight,
  });

  final String text;
  final Color? color;
  final double size;
  final double? lineHeight;
  final double? letterSpacing;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.notoSans(
        fontSize: size,
        color: size > 24
            ? color ?? Theme.of(context).textTheme.titleLarge!.color
            : color ?? Theme.of(context).textTheme.titleSmall!.color,
        letterSpacing: letterSpacing,
        height: lineHeight,
        fontWeight: fontWeight,
      ),
    );
  }
}
