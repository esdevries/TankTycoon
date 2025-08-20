import 'dart:math';

class Tank {
  final String name;
  final String nation;
  final String description;
  final int basePrice;
  final List<String> imagePaths;
  int playerAmount;

  Tank({
    required this.name,
    required this.nation,
    required this.description,
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
