import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'layout/home_layout.dart';
import 'screen/homepage.dart';
import 'screen/loginhome.dart';
import 'screen/registerscrean.dart';
import 'screen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //light and dark Theme For the app
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          //statusBarColor شريط الحالة الخاص بالهاتف
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(0, 0, 0, 0),
          ),
        ),
      ),

      initialRoute: "homelayout",
      routes: {
        "/": (context) => SplashPage(),
        "loginhome": (context) => LoginHome(),
        "register": (context) => Register(),
        "homepage": (context) => HomePage(),
        "homelayout": (context) => HomeLayOut()
      },
      //home: LoginHome(),
    );
  }
}
