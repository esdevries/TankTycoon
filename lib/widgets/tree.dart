import 'package:app/data/vehicles.dart';
import 'package:app/models/vehicle.dart';
import 'package:app/screens/nation.dart';
import 'package:app/widgets/card.dart';
import 'package:flutter/material.dart';

class VehicleTree extends StatelessWidget {
  const VehicleTree({super.key});

  @override
  Widget build(BuildContext context) {
    final currentNation = NationScope.of(context).currentNation;
    final vehicles = allVehicles[currentNation] ?? {};

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(child: _buildVehicleColumn("Tank", vehicles["Tank"])),
              const SizedBox(width: 12),
              Flexible(child: _buildVehicleColumn("Plane", vehicles["Plane"])),
              const SizedBox(width: 12),
              Flexible(child: _buildVehicleColumn("Ship", vehicles["Ship"])),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildVehicleColumn(String title, List<Vehicle>? list) {
  if (list == null || list.isEmpty) {
    return const SizedBox();
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (final vehicle in list) ...[
        VehicleCard(vehicle: vehicle),
        const SizedBox(height: 12),
      ],
    ],
  );
}
