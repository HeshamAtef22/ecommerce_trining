import 'package:flutter/material.dart';


import 'homepage.dart';
import 'loginhome.dart';
import 'registerscrean.dart';
import 'splashscreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      initialRoute: "/",
      routes: {
        "/": (context) => SplashPage(),
        "loginhome": (context) => LoginHome(),
        "register": (context) => Register(),
        "homepage":(context) => HomePage(),

        
      },
      //home: LoginHome(),
    );
  }
}
