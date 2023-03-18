import 'package:flutter/material.dart';
import 'package:hero_tour_app/screens/dashboard_screen.dart';
import 'package:hero_tour_app/screens/heroes_screen.dart';
import 'package:hero_tour_app/widgets/navbar_button.dart';
import 'package:hero_tour_app/widgets/navbar_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void changeIndex(int index) => setState(() {
        _selectedIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const NavbarTitle(label: 'Tour of Heroes'),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                NavbarButton(
                  onPressed: () => changeIndex(0),
                  label: 'Dashboard',
                ),
                const SizedBox(
                  width: 20,
                ),
                NavbarButton(
                  onPressed: () => changeIndex(1),
                  label: 'Heroes',
                ),
              ],
            ),
            _widgets.elementAt(_selectedIndex),
          ],
        ),
      ),
    );
  }
}

const _widgets = [
  DashboardScreen(),
  HeroesScreen(),
];
