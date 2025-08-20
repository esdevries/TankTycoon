import '../models/tank.dart';

final List<Tank> allTanks = [
  Tank(
    name: 'Panzerkampfwagen I',
    nation: 'Germany',
    description:
        "The Panzerkampfwagen I (PzKpfw I) was Germany's first mass-produced tank, developed in the early 1930s mainly as a training vehicle to give crews and industry experience with armored warfare. Lightly armed with only machine guns and thin armor, it was not designed for front-line combat but was used extensively during the Spanish Civil War and in the early campaigns of World War II, including Poland and France. By 1941, it was largely obsolete in battle but remained in service for training, reconnaissance, and as a chassis for command, anti-aircraft, and self-propelled gun conversions.",
    basePrice: 5,
    imagePaths: [
      'images/germany/pz1/pz1_1.png',
      'images/germany/pz1/pz1_2.jpg',
      'images/germany/pz1/pz1_3.jpg',
      'images/germany/pz1/pz1_4.jpg',
    ],
  ),
];
