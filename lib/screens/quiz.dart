import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:low/quiz/quiz_year.dart';

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
        child: Column(
          children: [
            const Text(
              'Quiz ',
              style: TextStyle(fontSize: 40),
            ),
            const Spacer(
              flex: 1,
            ),
            Center(
                child: SizedBox(
              width: 280,
              height: 50,
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.purpleAccent)),
                  onPressed: () {},
                  child: const Text(
                    'START YOUR QUIZ',
                    style: TextStyle(fontSize: 20),
                  )),
            )),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      )),
    );
  }
}
