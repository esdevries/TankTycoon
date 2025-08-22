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
              builder: (context) {
                final screenSize = MediaQuery.of(context).size;

                return Dialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 16),
                  backgroundColor: Colors.transparent,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: screenSize.height * 0.8,
                      maxWidth: screenSize.width * 0.85,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF505A69),
                        border: Border.all(
                          color: const Color(0xFF1C1F26),
                          width: 8,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: SafeArea(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Padding(
                              padding: EdgeInsets.all(
                                constraints.maxHeight * 0.02,
                              ),
                              child: ClipRRect(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        vehicleName,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        description,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      ...imagePaths.map(
                                        (path) => Padding(
                                          padding: const EdgeInsets.only(
                                            bottom: 12,
                                          ),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                maxWidth: 1000,
                                              ),
                                              child: Image.asset(
                                                path,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
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
