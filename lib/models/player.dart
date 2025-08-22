import 'package:app/models/vehicle.dart';

class Player {
  int battlePoints;
  int prestigeLevel;
  double multiplier;

  Player({
    this.battlePoints = 5,
    this.prestigeLevel = 0,
    this.multiplier = 1.0,
  });

  bool spendBattlePoints(int amount) {
    if (battlePoints >= amount) {
      battlePoints -= amount;
      return true;
    }
    return false;
  }

  void earnBattlePoints(int amount) {
    battlePoints += amount;
  }

  void prestige(double newMultiplier, List<Vehicle> vehicles) {
    battlePoints = 5;
    prestigeLevel++;
    multiplier *= newMultiplier;

    for (var vehicle in vehicles) {
      vehicle.prestige();
    }
  }
}
