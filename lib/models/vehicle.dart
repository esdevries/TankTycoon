import 'dart:math';

class Vehicle {
  final String name;
  final String gameInfo;
  final double income;
  final String generalDescription;
  final int basePrice;
  final List<String> imagePaths;
  int playerAmount;

  Vehicle({
    required this.name,
    required this.gameInfo,
    required this.income,
    required this.generalDescription,
    required this.basePrice,
    required this.imagePaths,
    this.playerAmount = 0,
  });

  int get currentPrice {
    return (basePrice * pow(1.15, playerAmount).toDouble()).toInt();
  }

  void buy() {
    playerAmount++;
  }

  void prestige() {
    playerAmount = 0;
  }
}
