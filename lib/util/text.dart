import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget outlinedText(
  String text,
  BuildContext context, {
  double multiplier = 1.0,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;
      final fontSize = maxWidth * 0.1 * multiplier;

      return Stack(
        children: [
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.unifrakturCook(
              textStyle: TextStyle(
                fontSize: fontSize,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = fontSize * 0.2
                  ..color = Colors.black,
              ),
            ),
          ),
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.unifrakturCook(
              textStyle: TextStyle(fontSize: fontSize, color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
