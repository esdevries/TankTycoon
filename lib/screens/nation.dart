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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomNavigationBar Sample')),
      body: NationScope(
        currentNation: _nationOptions[_selectedIndex],
        child: const Padding(padding: EdgeInsets.all(16), child: VehicleTree()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Germany'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Soviet Union',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'USA'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
