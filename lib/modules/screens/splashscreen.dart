import 'package:easy_splash_screen/easy_splash_screen.dart';

import 'package:flutter/material.dart';

import '../login/loginhome.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/images/logo.png'),
      title: Text(
        "Mega",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.purple.shade100,
      showLoader: true,
      loadingText: Text("Loading..."),
      navigator: LoginHome(),
      durationInSeconds: 2,
    );
  }
}
