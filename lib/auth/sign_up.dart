import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'otp_screen.dart';

final usernameProvider = StateProvider<String>((ref) => "");
final phoneProvider = StateProvider<String>((ref) => "");

class SignUpForm extends ConsumerWidget {
  const SignUpForm({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(usernameProvider);
    final phoneNumber = ref.watch(phoneProvider);
    TextEditingController usersnameInput = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 165, 158, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 130,
              ),
              const Text(
                'Welcome To !\n Passco Quiz App Learning Platform.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Create your account.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                ),
              ),
              //mmmmmmmmmmmmmmmmmmmmmmmmmmmmm
              // form section which contain the  username and the number input field
              // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
              const SizedBox(
                height: 60,
              ),
              Form(
                  child: Column(
                children: [
                  //mmmmmmmmmmmmmm
                  // username field
                  // mmmmmmmmmmm

                  TextField(
                    style: const TextStyle(color: Colors.black),
                    controller: usersnameInput,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: 'UserName',
                        hintStyle: const TextStyle(color: Colors.black),
                        fillColor: Colors.white.withOpacity(0.9),
                        filled: true,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //mmmmmmmmmmmmmm
                  // phone number field
                  // mmmmmmmmmmm

                  TextField(
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: const TextStyle(color: Colors.black),
                        suffixIcon: const Icon(Icons.numbers),
                        fillColor: Colors.white.withOpacity(0.9),
                        filled: true,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
                  ),

                  //mmmmmmmmmmmmmm
                  // login submit button
                  // mmmmmmmmmmm
                  const SizedBox(
                    height: 22,
                  ),

                  SizedBox(
                      width: 600,
                      height: 50,
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Colors.purpleAccent)),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const OTPScreen())));
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 18),
                          )))
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
