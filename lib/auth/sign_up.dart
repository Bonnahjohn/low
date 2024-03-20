import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/nav.dart';

class SignUpForm extends ConsumerWidget {
  const SignUpForm({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 165, 158, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const Spacer(
                  flex: 1,
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
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: 'UserName',
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
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: 'Phone Number',
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
                                      builder: ((context) =>
                                          const NavigationTab())));
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 18),
                            )))
                  ],
                )),
                const Spacer(
                  flex: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
