import 'package:flutter/material.dart';

class VehicleInfoIcon extends StatelessWidget {
  final String vehicleName;
  final List<String> imagePaths;
  final String description;

  const VehicleInfoIcon({
    super.key,
    required this.vehicleName,
    required this.imagePaths,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 8,
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: Text(vehicleName),
                content: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.6,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(description, style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 16),
                        ...imagePaths.map(
                          (path) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Image.asset(path),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(6),
            child: const Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
