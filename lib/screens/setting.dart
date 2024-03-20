import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:low/auth/sign_up.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Text(
                'Settings ',
                style: TextStyle(fontSize: 40),
              ),
              //mmmmmmmmmmm
              // theme setting
              // mmmmmmmmmm
              const Text(
                '\n\nTHEME SETTING',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: ListTile(
                  trailing: const Icon(Icons.light_mode),
                  title: const Text('Appearance setting'),
                  leading: ValueListenableBuilder(
                    valueListenable: Hive.box('store').listenable(),
                    builder: (context, box, child) {
                      final theme = box.get('theme', defaultValue: false);
                      return Switch(
                        value: theme,
                        onChanged: (value) {
                          box.put('theme', value);
                        },
                      );
                    },
                  ),
                ),
              ),
              //mmmmmmmmmmmmmmmmmmmmmmm
              // spread the app
              // mmmmmmmmmmmmmmmmmmmmmm
              const SizedBox(
                height: 40,
              ),
              const Text(
                'SPREAD THE WORD',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.star_border),
                  title: Text('Rate App'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.share),
                  title: Text('Share App'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              )

              //mmmmmmmmmmmmmmmmmmmmmmm
              // support the privacy
              // mmmmmmmmmmmmmmmmmmmmmm
              ,
              const SizedBox(
                height: 40,
              ),
              const Text(
                'SUPPORT THE PRIVACY ',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email Us'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              const SizedBox(
                height: 0,
              ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.policy),
                  title: Text('Privacy Policy'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.note),
                  title: Text('Terms Of Use'),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ),
              //mmmmmmmmmmmmmmmmmmmmmmm
              // Logout
              // mmmmmmmmmmmmmmmmmmmmmm

              const SizedBox(
                height: 40,
              ),
              const Text(
                'ACCOUNT',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('LogOut'),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const SignUpForm())));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
