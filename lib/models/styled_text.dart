import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class StyledText extends StatelessWidget {
  const StyledText({super.key,required this.color,required this.size,required this.text});

  final Color color;
  final double size;

  final dynamic text;

  @override
  Widget build(BuildContext context) {
    return Text(text,style:
      GoogleFonts.robotoMono(
        color: color,
        fontSize: size,
      ),);
  }
}
