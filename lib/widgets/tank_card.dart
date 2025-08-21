import 'package:app/models/tank.dart';
import 'package:app/widgets/tank_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TankCard extends StatelessWidget {
  final Tank tank;

  const TankCard({super.key, required this.tank});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: SizedBox(
            width: 600,
            height: 220,
            child: Material(
              borderRadius: BorderRadius.circular(12),
              color: Colors.transparent,
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 0.5, 1.0],
                    colors: [
                      Color(0xFF4A6A8C),
                      Color(0xFF617C99),
                      Color(0xFF354C6B),
                    ],
                  ),
                  border: Border.all(color: Colors.grey.shade800, width: 4),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {},
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Text(
                                        tank.name,
                                        style: GoogleFonts.unifrakturCook(
                                          textStyle: TextStyle(
                                            fontSize: 32,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 6
                                              ..color = Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        tank.name,
                                        style: GoogleFonts.unifrakturCook(
                                          textStyle: const TextStyle(
                                            fontSize: 32,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Stack(
                                    children: [
                                      Text(
                                        tank.gameInfo,
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      Text(
                                        'Price: ${tank.currentPrice}',
                                        style: GoogleFonts.unifrakturCook(
                                          textStyle: TextStyle(
                                            fontSize: 24,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 6
                                              ..color = Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Price: ${tank.currentPrice}',
                                        style: GoogleFonts.unifrakturCook(
                                          textStyle: const TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Stack(
                                    children: [
                                      Text(
                                        'Fighting: ${tank.playerAmount}',
                                        style: GoogleFonts.unifrakturCook(
                                          textStyle: TextStyle(
                                            fontSize: 24,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 6
                                              ..color = Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Fighting: ${tank.playerAmount}',
                                        style: GoogleFonts.unifrakturCook(
                                          textStyle: const TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: 250,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color.fromARGB(255, 15, 15, 15),
                              width: 3,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(9),
                            child: Stack(
                              children: [
                                Ink.image(
                                  image: AssetImage(tank.imagePaths.first),
                                  fit: BoxFit.cover,
                                  child: Container(),
                                ),

                                TankInfoIcon(
                                  tankName: tank.name,
                                  imagePaths: tank.imagePaths,
                                  description: tank.generalDescription,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
