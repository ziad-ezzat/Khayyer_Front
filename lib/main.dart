import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login_Screen.dart';
import 'onBoarding_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> getLandingPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstTime = prefs.getBool('first_time');

    if (isFirstTime != null && !isFirstTime) { // If it's not the first time
      return LoginScreen();
    } else { // If it's the first time
      prefs.setBool('first_time', false);
      return OnboardingScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: getLandingPage(),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(); // Add a splash screen here while waiting
          } else {
            return snapshot.data!;
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}