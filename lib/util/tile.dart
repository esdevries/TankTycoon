import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildTileBackground({required List<Color> colors}) {
  return Stack(
    children: [
      for (var i = 1; i <= 3; i++)
        Positioned(
          top: -1.5 * i,
          bottom: -1.5 * i,
          left: -0.5 * i,
          right: -0.5 * i,
          child: SvgPicture.asset(
            'assets/ui/tile_layer$i.svg',
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(colors[i - 1], BlendMode.srcIn),
          ),
        ),
    ],
  );
}
