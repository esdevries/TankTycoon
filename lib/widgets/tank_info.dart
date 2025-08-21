import 'package:flutter/material.dart';

class TankInfoIcon extends StatelessWidget {
  final String tankName;
  final List<String> imagePaths; // <-- list of image paths
  final String description;

  const TankInfoIcon({
    super.key,
    required this.tankName,
    required this.imagePaths,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 8,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(tankName),
              content: ConstrainedBox(
                // Limit max height of the dialog content
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.6,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(description, style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 16),
                      // Loop over all images
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
          decoration: BoxDecoration(
            color: Colors.black54,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(6),
          child: const Icon(Icons.info_outline, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
