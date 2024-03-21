import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Subject {
  late String subjectName;
  late String subjectImage;
  late int subjectId;
  late List<String> subjectYear;
  Subject(
      {required this.subjectId,
      required this.subjectName,
      required this.subjectImage,
      required this.subjectYear});

  factory Subject.fromJson(Map<String, dynamic> json) {
    List<dynamic> topicsData = json["attributes"]["topics"]["data"];
    List<String> allTopics = [];

    for (var topicData in topicsData) {
      String topic = topicData["attributes"]["Topic"].toString();
      allTopics.add(topic);
    }
    return Subject(
        subjectId: json["id"] ?? 1,
        subjectName: json["attributes"]["Subject"] ?? "",
        subjectImage: json["attributes"]["Subject_image"]["data"]["attributes"]
                ["url"]
            .toString(),
        subjectYear: allTopics);
  }
}

class SubjectApiService {
  static Future<List<Subject>> getSubjectApi() async {
    var response = await http
        .get(Uri.parse("http://10.0.2.2:1337/api/subjects?populate=*"));
    if (response.statusCode != 2001) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => Subject.fromJson(e)).toList();
    }

    throw Exception('Api failed to load');
  }
}

final apiserviceForSubject = Provider<SubjectApiService>((ref) {
  return SubjectApiService();
});

final apiServiceData = FutureProvider<List<Subject>>((ref) async {
  return SubjectApiService.getSubjectApi();
});
