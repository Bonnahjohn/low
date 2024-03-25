import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class QuizListLoading extends StatefulWidget {
  const QuizListLoading({super.key});

  @override
  State<QuizListLoading> createState() => _QuizListLoadingState();
}

class _QuizListLoadingState extends State<QuizListLoading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: title(),
    );
  }
}

Widget title() {
  return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemCount: 25,
        itemBuilder: (context, index) {
          return ListTile(
            trailing: const Icon(Icons.arrow_forward_ios),
            title: Container(
              width: 10,
              height: 10,
              color: Colors.white,
            ),
            subtitle: SizedBox(
                width: 10, height: 6, child: Container(color: Colors.white)),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3), color: Colors.white),
            ),
          );
        },
      ));
}

//mmmmmmmmmmmmmmmmmmmmmmmmmmm
//home gridview  preload
//mmmmmmmmmmmmmmmmmmmmmm
Widget gridviewer() {
  return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Container(
                      color: Colors.white, child: const Icon(Icons.abc)),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Center(
                  child: Text(
                    'sub.subjectName',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                const Text(
                  'Questions from 1989 -> 2020 ',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                )
              ],
            ),
          );
        },
      ));
}
