import 'package:flutter/material.dart';
import 'package:low/provider/api.dart';
import 'package:low/screens/home.dart';
import 'package:low/screens/quiz.dart';

import '../screens/setting.dart';

class NavigationTab extends StatefulWidget {
  const NavigationTab({super.key});

  @override
  State<NavigationTab> createState() => _NavigationTabState();
}

class _NavigationTabState extends State<NavigationTab> {
  late int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const UserProfile(),
        const QuizPage(),
        const Settings(),
      ][selectedIndex],
      bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.grey.shade700.withOpacity(0.2),
          indicatorShape: const BeveledRectangleBorder(),
          indicatorColor: const Color.fromRGBO(0, 165, 158, 1).withOpacity(0.8),
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                icon: Icon(Icons.home),
                label: 'Home'),
            //mmmmmmmmmmmmmmmmm
            NavigationDestination(
                selectedIcon: Icon(Icons.quiz_outlined, color: Colors.white),
                icon: Icon(Icons.quiz),
                label: 'Quiz'),

            //mmmmmmmmmmmmmmmmmm

            NavigationDestination(
                selectedIcon: Icon(
                  Icons.settings_applications_sharp,
                  color: Colors.white,
                ),
                icon: Icon(Icons.settings),
                label: 'Settings'),
          ]),
    );
  }
}