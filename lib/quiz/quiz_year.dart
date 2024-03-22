// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/subjectapi.dart';

class ChooseQuizYear extends ConsumerWidget {
  final Subject sub;
  const ChooseQuizYear({super.key, required this.sub});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(apiServiceData);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(0, 165, 158, 1),
        title: Text(sub.subjectName),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: data.when(
          data: (subjects) {
            final subject = subjects.firstWhere(
              (element) => element.subjectId == sub.subjectId,
              orElse: () => Subject(
                subjectId: 1,
                subjectName: 'Not Found',
                subjectImage: '',
                subjectYear: [],
              ),
            );
            return ListView.builder(
              itemCount: subject.subjectYear.length,
              itemBuilder: (context, index) {
                final topic = subject.subjectYear[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      'http://10.0.2.2:1337${sub.subjectImage}',
                      width: 60,
                      height: 59,
                      fit: BoxFit.cover,
                    ),
                    title: Text(sub.subjectName),
                    subtitle: Text(topic),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                    splashColor: Colors.blue[300],
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) =>
              const Center(child: Text('Unable to fetch data')),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      )),
    );
  }
}
