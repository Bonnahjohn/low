import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:low/quiz/quiz_year.dart';

import '../loading/shimmer_quiz_year.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
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
