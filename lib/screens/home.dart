import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:low/provider/subject_api.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(apiServiceData);
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: 6, left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //mmmmmmmmmmmmmmm
                  //the greetings of the user and the user profile picture
                  //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi User',
                            style: TextStyle(
                                fontSize: 22,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('Let\'s make this day productive.')
                        ],
                      ),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.red,
                        ),
                      ),
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
                    'Let\'s Start',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: data.when(
                      data: (subjects) {
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
                              press: () {},
                            );
                          },
                        );
                      },
                      error: (error, stackTrace) => Text('Error: $error'),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
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
      onTap: () {},
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
            'Welcome to the Passco Quiz!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Test your knowledge and learn new things.',
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
