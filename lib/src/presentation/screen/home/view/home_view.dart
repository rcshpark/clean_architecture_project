import 'package:flutter/material.dart';
import 'package:health_care/src/presentation/screen/nutrient/view/nutrient_search_view.dart';
import 'package:health_care/src/presentation/screen/nutrient/view/nutrient_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  List pages = [NutrientScreen(), NutrientSearchScreen(), Container()];

  void selected(int value) {
    setState(() {
      _index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: selected,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_bike), label: '운동'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dining_rounded), label: '식단'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '기타'),
        ],
      ),
    );
  }
}
