import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:low/auth/sign_up.dart';

class UserAuth {
  late String userName;

  UserAuth({required this.userName});
  factory UserAuth.fromJson(Map<String, dynamic> json) {
    return UserAuth(userName: json["attributes"]["Username"]);
  }
}

// class ApiUser {
//static
Future<UserAuth> registerUser(String userName) async {
  final response = await http.post(
    Uri.parse("http://10.0.2.2:1337/api/auths"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'userName': userName,
    }),
  );
  if (response.statusCode != 2001) {
    print("succeessful ${response.body}");
    return UserAuth.fromJson(jsonDecode(response.body));
  }
  throw Exception('Username loading faile');
}
// }

// final authApiProvider = Provider<ApiUser>((ref) {
//   return ApiUser();
// });

// final authProvider = FutureProvider<UserAuth>((ref) async {
//   return ApiUser.registerUser();
// });

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController _controller = TextEditingController();
  late Future<UserAuth> futureUse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: (Column(
          children: [
            TextField(
              controller: _controller,
            ),
            ElevatedButton(
                onPressed: () {
                  registerUser(_controller.text);
                },
                child: Text('data'))
          ],
        )),
      ),
    );
  }
}
