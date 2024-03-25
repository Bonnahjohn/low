import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:low/provider/subjectapi.dart';
import 'package:low/quiz/quiz_year.dart';

import '../loading/shimmer_quiz_year.dart';
import '../provider/profile_avatar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(apiServiceData);
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //mmmmmmmmmmmmmmm
                  //the greetings of the user and the user profile picture
                  //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi',
                            style: TextStyle(
                                fontSize: 22,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('Let\'s make this day productive.')
                        ],
                      ),
                      CircleAvatarWithUpload()
                    ],
                  ),
                  //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
                  const SizedBox(
                    height: 30,
                  ),

                  //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
                  // the welcoming card
                  // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
                  buildQuizInfoCard(),
                  //mmmmmmm
                  const SizedBox(
                    height: 20,
                  ),
                  //mmmmmmmmmmmmmmmmmmmmmmmmmm
                  //the choosing of the subject
                  // mmmmmmmmmmmmmmmmmmmmmmmmmmmmm
                  const Text(
                    'Let\'s play',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: data.when(
                      data: (subjects) {
                        subjects.sort(
                            (a, b) => a.subjectName.compareTo(b.subjectName));
                        return GridView.builder(
                          itemCount: subjects.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            final subject = subjects[index];
                            return SubjectCard(
                              sub: subject,
                              press: () {
                                Get.to(
                                    duration: const Duration(seconds: 1),
                                    transition: Transition.zoom,
                                    () => ChooseQuizYear(
                                          sub: subject,
                                        ));
                              },
                            );
                          },
                        );
                      },
                      error: (error, stackTrace) => Text('Error: $error'),
                      loading: () => gridviewer(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ))),
    );
  }
}

//mmmmmmmmmmmmmmmmmmmmmmmm
//the card which is represent  each subject
// mmmmmmmmmmmmmmmmmmmmmmmmmm

class SubjectCard extends StatelessWidget {
  final Subject sub;
  final Function press;

  const SubjectCard({super.key, required this.sub, required this.press});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: SizedBox(
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Image.network(
                  'http://10.0.2.2:1337${sub.subjectImage}',
                  width: 100,
                  height: 95,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Text(
                  sub.subjectName,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const Text(
                'Questions from 1989 -> 2020 ',
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildQuizInfoCard() {
  return Card(
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to  Passco Quiz App!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Study WAEC past questions and answers and prepare for your West African Examinations Council exam.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Tips for a successful quiz:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '- Take your time to read each question carefully.',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '- Don\'t hesitate to skip a question and come back to it later.',
            style: TextStyle(fontSize: 16),
          ),
          Text(
            '- Enjoy the process of learning!',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
