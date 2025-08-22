import 'package:app/models/vehicle.dart';
import 'package:app/util/text.dart';
import 'package:app/widgets/info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/util/tile.dart';

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;
  const VehicleCard({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardWidth * 0.03),
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          child: Stack(
            children: [
              Positioned.fill(
                child: buildTileBackground(
                  colors: [
                    Color(0xFF1C1F26),
                    Color(0xFF2E323D),
                    Color(0xFF505A69),
                  ],
                ),
              ),

              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(cardWidth * 0.03),
                    onTap: () {
                      // handle tap
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: cardWidth * 0.035,
                        vertical: cardWidth * 0.05,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top row
                          Row(
                            children: [
                              // Vehicle name
                              Expanded(
                                flex: 3,
                                child: outlinedText(vehicle.name, context),
                              ),
                              SizedBox(width: cardWidth * 0.02),
                              // Player count
                              Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: outlinedText(
                                    '${vehicle.playerAmount} in Battle',
                                    context,
                                    multiplier: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: cardWidth * 0.02),

                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left column: info + cost
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Vehicle game info
                                      Expanded(
                                        child: Text(
                                          vehicle.gameInfo,
                                          maxLines: 6,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                              fontSize: cardWidth * 0.04,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: cardWidth * 0.01),
                                      outlinedText(
                                        'Cost: ${vehicle.currentPrice}Bp',
                                        context,
                                        multiplier: 1.5,
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(width: cardWidth * 0.02),

                                SizedBox(
                                  width: cardWidth * 0.47,
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
        );
      },
    );
  }
}
