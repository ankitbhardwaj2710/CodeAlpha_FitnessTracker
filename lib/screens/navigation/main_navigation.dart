import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import '../workout/workout_screen.dart';
import '../stats/stats_screen.dart';
import '../settings/settings_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentPage;

    switch (currentIndex) {
      case 0:
        currentPage = const HomeScreen();
        break;
      case 1:
        currentPage = const WorkoutScreen();
        break;
      case 2:
        currentPage = const StatsScreen();
        break;
      case 3:
        currentPage = const SettingsScreen();
        break;
      default:
        currentPage = const HomeScreen();
    }

    return Scaffold(
      body: currentPage,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center_outlined),
            selectedIcon: Icon(Icons.fitness_center),
            label: "Workout",
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: "Stats",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}