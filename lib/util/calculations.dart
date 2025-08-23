import 'dart:math';

int calculateCurrentPrice(int basePrice, int amountOwned) {
  return (basePrice * pow(1.15, amountOwned)).toInt();
}
