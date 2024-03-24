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
            trailing: Icon(Icons.abc),
            title: Container(
              width: 20,
              height: 16,
              color: Colors.amber,
            ),
            subtitle: SizedBox(
                width: 10, height: 6, child: Container(color: Colors.white)),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
            ),
          );
        },
      ));
}
