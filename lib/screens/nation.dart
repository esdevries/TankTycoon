import 'package:app/data/nations.dart';
import 'package:app/util/text.dart';
import 'package:app/widgets/tree.dart';
import 'package:flutter/material.dart';

class NationScope extends InheritedWidget {
  final String currentNation;

  const NationScope({
    required this.currentNation,
    required super.child,
    super.key,
  });

  static NationScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<NationScope>();
    assert(scope != null, 'No NationScope found in context');
    return scope!;
  }

  @override
  bool updateShouldNotify(NationScope oldWidget) =>
      oldWidget.currentNation != currentNation;
}

class Nation extends StatefulWidget {
  const Nation({super.key});

  @override
  State<Nation> createState() => _NationState();
}

class _NationState extends State<Nation> {
  int _selectedIndex = 0;

  static const List<String> _nationOptions = [
    'Germany',
    'Soviet Union',
    'United States',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget customBottomNavBar(BuildContext context) {
    final tabs = [
      {'label': 'Germany', 'icon': 'assets/images/germany/icon.png'},
      {'label': 'Soviet Union', 'icon': 'assets/images/soviet/icon.png'},
      {'label': 'United States', 'icon': 'assets/images/usa/icon.png'},
    ];
    final countryColors = nationColors[_nationOptions[_selectedIndex]]!;

    return Container(
      color: countryColors.first,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(tabs.length, (index) {
          final isSelected = _selectedIndex == index;

          return Expanded(
            child: Material(
              color: isSelected ? countryColors.last : Colors.transparent,
              child: InkWell(
                onTap: () => _onItemTapped(index),
                splashColor: Colors.black26,
                highlightColor: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        tabs[index]['icon']!,
                        width: (MediaQuery.of(context).size.width * 0.04).clamp(
                          28.0,
                          double.infinity,
                        ),
                        height: (MediaQuery.of(context).size.width * 0.04)
                            .clamp(28.0, double.infinity),
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 4),
                      outlinedText(
                        tabs[index]['label']!,
                        context,
                        multiplier: 0.3,
                        minSize: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomNavigationBar Sample')),
      body: NationScope(
        currentNation: _nationOptions[_selectedIndex],
        child: const Padding(padding: EdgeInsets.all(16), child: VehicleTree()),
      ),
      bottomNavigationBar: customBottomNavBar(context),
    );
  }
}

BottomNavigationBarItem buildNationNavItem(
  String assetPath,
  String label,
  BuildContext context,
) {
  double iconSize = (MediaQuery.of(context).size.width * 0.03).clamp(
    24.0,
    40.0,
  );

  return BottomNavigationBarItem(
    icon: Image.asset(
      assetPath,
      width: iconSize,
      height: iconSize,
      fit: BoxFit.contain,
    ),
    label: label,
  );
}
