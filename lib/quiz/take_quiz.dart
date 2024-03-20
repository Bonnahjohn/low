// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TakeQuiz extends StatefulWidget {
  const TakeQuiz({super.key});
  @override
  State<TakeQuiz> createState() => _TakeQuizState();
}

class _TakeQuizState extends State<TakeQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                child: const Text(
                  '\nWhat is the capital of France?',
                  style: TextStyle(fontSize: 30),
                ),
              )),
          //mmmmmmmmmmmmmmmm
          Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  children: [
                    Choicebtn(),
                    const SizedBox(
                      height: 10,
                    ),
                    Choicebtn(),
                    const SizedBox(
                      height: 10,
                    ),
                    Choicebtn(),
                    const SizedBox(
                      height: 10,
                    ),
                    Choicebtn()
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                child: const Center(
                  child: Text(
                    '30',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ))
        ],
      )),
    );
  }
}

Widget Choicebtn() {
  return SizedBox(
      width: 300,
      height: 60,
      child: ElevatedButton(
          style: const ButtonStyle(
              overlayColor: MaterialStatePropertyAll(Colors.green)),
          onPressed: () {},
          child: const Text(
            maxLines: 1,
            'Paris',
            style: TextStyle(),
          )));
}
