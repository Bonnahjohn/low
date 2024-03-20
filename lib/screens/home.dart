import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(top: 6, left: 12, right: 12),
              child: Column(
                children: [
                  //mmmmmmmmmmmmmmm
                  //the greetings of the user and the user profile picture
                  //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi, User',
                        style: TextStyle(
                            fontSize: 25, fontStyle: FontStyle.italic),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.red,
                        ),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
