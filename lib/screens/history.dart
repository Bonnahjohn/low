import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:low/quiz/quiz_year.dart';

import '../loading/shimmer_quiz_year.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: QuizListLoading(),
      )),
    );
  }
}
