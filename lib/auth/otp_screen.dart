// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../components/nav.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({
    super.key,
  });

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 165, 158, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(0, 165, 158, 1),
        centerTitle: true,
        title: const Text(
          'Verification  Code',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'We have sent you a 4-digit OTP',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  4,
                  (index) => SizedBox(
                    width: 50,
                    child: TextField(
                      controller: controllers[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, fontSize: 25),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      onChanged: (String value) {
                        if (value.isNotEmpty &&
                            index < controllers.length - 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        counterText: "",
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: 600,
                height: 50,
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.purpleAccent)),
                  onPressed: () {
                    String otp = '';
                    for (var controller in controllers) {
                      otp += controller.text;
                    }
                    // Here you can implement your OTP verification logic
                    print('OTP entered: $otp');
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const NavigationTab())));
                  },
                  child: const Text(
                    'Verify OTP',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Resend OTP',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
