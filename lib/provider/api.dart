import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RestApi {
  final String name;
  final int number;
  RestApi({
    //required this.email,
    required this.name,
    required this.number,
    //required this.id
  });

  factory RestApi.fromJson(Map<String, dynamic> json) {
    return RestApi(
      name: json['attributes']['Username'] ?? '',
      number: json['attributes']['phnone'] ?? 0,
    );
  }
}

class ApiServices {
  // String endpoint = 'https://reqres.in/api/users?page=2';

  static Future<List<RestApi>> getApi() async {
    var response =
        await http.get(Uri.parse("http://10.0.2.2:1337/api/frenches"));

    if (response.statusCode != 201) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => RestApi.fromJson(e)).toList();
    }
    throw Exception('Api failed to load');
  }
}

final userProvider = Provider<ApiServices>((ref) => ApiServices());
final userDataprovider = FutureProvider<List<RestApi>>((ref) async {
  return ApiServices.getApi();
});

class UserProfile extends ConsumerWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(userDataprovider);
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: data.when(
                  data: (data) {
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Card(
                            child: ListTile(
                              title: Text('${data[index].name}',
                                  style: TextStyle(color: Colors.red)),
                              trailing: Text('${data[index].number}'),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      )))),
    );
  }
}
