// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:low/auth/sign_up.dart';

import 'package:low/screens/home.dart';
import 'package:low/screens/quiz.dart';
import '../screens/setting.dart';

class NavigationTab extends StatefulWidget {
  String? usersnameInput;
  NavigationTab({super.key, required this.usersnameInput});

  @override
  State<NavigationTab> createState() => _NavigationTabState();
}

class _NavigationTabState extends State<NavigationTab> {
  late int selectedIndex = 0;
  String? usersnameInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomeScreen(),
        const QuizPage(),
        const Settings(),
      ][selectedIndex],
      bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.grey.shade700.withOpacity(0.2),
          indicatorShape: const BeveledRectangleBorder(),
          indicatorColor: const Color.fromRGBO(0, 165, 158, 1).withOpacity(0.6),
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
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home'),
            //mmmmmmmmmmmmmmmmm
            NavigationDestination(
                selectedIcon: Icon(Icons.quiz_outlined, color: Colors.white),
                icon: Icon(Icons.quiz),
                label: 'History'),

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
