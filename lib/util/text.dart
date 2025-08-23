import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget outlinedText(
  String text,
  BuildContext context, {
  double multiplier = 1.0,
  double minSize = 0.0,
  double maxSize = double.infinity,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final maxWidth = constraints.maxWidth;
      final fontSize = maxWidth * 0.1 * multiplier;
      final clampedFontSize = fontSize.clamp(minSize, maxSize).toDouble();

      return Stack(
        children: [
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.unifrakturCook(
              textStyle: TextStyle(
                fontSize: clampedFontSize,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = clampedFontSize * 0.2
                  ..color = Colors.black,
              ),
            ),
          ),
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.unifrakturCook(
              textStyle: TextStyle(
                fontSize: clampedFontSize,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    },
  );
}
