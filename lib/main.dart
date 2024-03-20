import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:low/auth/sign_up.dart';

import 'screens/splash.dart';

final loaded = StateProvider<double>((ref) {
  return 01;
});

final loadede = StateProvider<double>((ref) {
  return 20;
});
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('store');

  runApp(const ProviderScope(
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: '',
    home: SplashScreen(),
  )));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return ValueListenableBuilder(
      valueListenable: Hive.box('store').listenable(),
      builder: (context, box, child) {
        final theme = box.get('theme', defaultValue: false);

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme ? ThemeData.dark() : ThemeData.light(),
          home: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light.copyWith(
                  systemNavigationBarColor:
                      const Color.fromRGBO(0, 165, 158, 1),
                  statusBarColor: const Color.fromRGBO(0, 165, 158, 1)),
              child: const SignUpForm()),
        );
      },
    );
  }
}
