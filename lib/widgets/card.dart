import 'package:app/models/vehicle.dart';
import 'package:app/widgets/info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleCard({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardHeight = screenWidth * 0.4;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenWidth * 0.02,
        horizontal: screenWidth * 0.01,
      ),
      child: SizedBox(
        height: cardHeight * 1.4,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          child: Stack(
            children: [
              // Background SVG layers
              Positioned.fill(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: SvgPicture.asset(
                        'assets/ui/tile_layer1.svg',
                        fit: BoxFit.fill,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF1C1F26),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: SvgPicture.asset(
                        'assets/ui/tile_layer2.svg',
                        fit: BoxFit.fill,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF2E323D),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: SvgPicture.asset(
                        'assets/ui/tile_layer3.svg',
                        fit: BoxFit.fill,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF505A69),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Material + InkWell for full-card tap animation
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                    onTap: () {
                      // handle tap
                    },
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top row: name + player count
                          Row(
                            children: [
                              // Left: vehicle name (takes more space)
                              Expanded(
                                flex: 3,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    final availableWidth = constraints.maxWidth;
                                    // tune multipliers to taste
                                    final rawFontSize = availableWidth * 0.18;
                                    final fontSize = rawFontSize.clamp(
                                      14.0,
                                      MediaQuery.of(context).size.width * 0.05,
                                    );

                                    return Stack(
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        // stroke
                                        Text(
                                          vehicle.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.unifrakturCook(
                                            textStyle: TextStyle(
                                              fontSize: fontSize,
                                              foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth =
                                                    fontSize *
                                                    0.2 // scale stroke with font
                                                ..color = Colors.black,
                                            ),
                                          ),
                                        ),
                                        // fill
                                        Text(
                                          vehicle.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.unifrakturCook(
                                            textStyle: TextStyle(
                                              fontSize: fontSize,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),

                              SizedBox(width: screenWidth * 0.02),

                              Expanded(
                                flex: 2,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    final w = constraints.maxWidth;
                                    final rawFontSize = w * 0.14;
                                    final fontSize = rawFontSize.clamp(
                                      12.0,
                                      MediaQuery.of(context).size.width * 0.05,
                                    );

                                    return Align(
                                      alignment: Alignment.centerRight,
                                      child: Stack(
                                        children: [
                                          Text(
                                            '${vehicle.playerAmount} in Battle',
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
                                            '${vehicle.playerAmount} in Battle',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.unifrakturCook(
                                              textStyle: TextStyle(
                                                fontSize: fontSize,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: screenWidth * 0.02),

                          // Main content
                          // Main content
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left column
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Vehicle game info
                                      Expanded(
                                        child: LayoutBuilder(
                                          builder: (context, constraints) {
                                            final availableWidth =
                                                constraints.maxWidth;
                                            final availableHeight =
                                                constraints.maxHeight;

                                            // derive font size from available space
                                            final rawFontSize =
                                                availableWidth * 0.06;
                                            final fontSize = rawFontSize.clamp(
                                              12.0,
                                              availableHeight * 0.25,
                                            );

                                            return Text(
                                              vehicle.gameInfo,
                                              maxLines: 8,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                  fontSize: fontSize,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),

                                      SizedBox(height: screenWidth * 0.01),

                                      // Cost text (stroke + fill)
                                      LayoutBuilder(
                                        builder: (context, constraints) {
                                          final w = constraints.maxWidth;
                                          final rawFontSize = w * 0.12;
                                          final fontSize = rawFontSize.clamp(
                                            14.0,
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                          );

                                          return Stack(
                                            children: [
                                              Text(
                                                'Cost: ${vehicle.currentPrice}Bp',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    GoogleFonts.unifrakturCook(
                                                      textStyle: TextStyle(
                                                        fontSize: fontSize,
                                                        foreground: Paint()
                                                          ..style =
                                                              PaintingStyle
                                                                  .stroke
                                                          ..strokeWidth =
                                                              fontSize * 0.2
                                                          ..color =
                                                              Colors.black,
                                                      ),
                                                    ),
                                              ),
                                              Text(
                                                'Cost: ${vehicle.currentPrice}Bp',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    GoogleFonts.unifrakturCook(
                                                      textStyle: TextStyle(
                                                        fontSize: fontSize,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(width: screenWidth * 0.01),

                                // Right column: vehicle image + info
                                SizedBox(
                                  width: cardHeight,
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Stack(
                                        children: [
                                          Ink(
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  vehicle.imagePaths.first,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Colors.transparent,
                                                  Colors.white.withValues(
                                                    alpha: 0.2,
                                                  ),
                                                  Colors.transparent,
                                                ],
                                                stops: const [0.0, 0.5, 1.0],
                                              ),
                                            ),
                                          ),
                                          VehicleInfoIcon(
                                            vehicleName: vehicle.name,
                                            imagePaths: vehicle.imagePaths,
                                            description:
                                                vehicle.generalDescription,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
