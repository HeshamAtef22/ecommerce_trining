import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'layout/home_layout.dart';
import 'modules/home/homepage.dart';
import 'modules/login/loginhome.dart';
import 'modules/screens/cartpage.dart';
import 'modules/screens/product_detail.dart';
import 'modules/login/registerscrean.dart';
import 'modules/screens/splashscreen.dart';
import 'tester_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //Theme App
      theme: ThemeData(
        //textTheme
        textTheme: const TextTheme(
          //خاصة بالعناوين بحجم كبير
          headlineLarge: TextStyle(
              letterSpacing: .80,
              color: Color.fromRGBO(34, 50, 99, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold),
          //خاص بالعناوين الفرعية بحجم متوسط ولون كحلي
          headlineMedium: TextStyle(
              letterSpacing: .80,
              color: Color.fromRGBO(34, 50, 99, 1),
              fontSize: 16,
              fontWeight: FontWeight.bold),
          //خاصة بالعناوين الرئيسية القابلة للضغط بلون ثيم البوتن
          headlineSmall: TextStyle(
              color: Color.fromRGBO(64, 191, 255, 1),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        //button Theme to all app
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: const Color.fromRGBO(64, 191, 255, 1),
              elevation: 10,
              fixedSize: Size(MediaQuery.of(context).size.width * .98,
                  MediaQuery.of(context).size.height * .07),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              )),
        ),

        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          toolbarHeight: 90,
          //white appbar and black text to app theme
          backgroundColor: Color.fromARGB(0, 182, 143, 143),
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(34, 50, 99, 1),
          ),
          elevation: 0.0,

          //statusBarColor شريط الحالة الخاص بالهاتف
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(0, 0, 0, 0),
          ),
        ),
      ),

      initialRoute: "homelayout",
      routes: {
        "splashscreen": (context) => SplashPage(),
        "loginhome": (context) => const LoginHome(),
        "register": (context) => const Register(),
        "homepage": (context) => const HomePage(),
        "homelayout": (context) => const HomeLayOut(),
        "cart": (context) => const CartPage(),
        "productdetail": (context) => const ProductDetail(),
        "tester": (context) => Tester(),
      },
      //home: LoginHome(),
    );
  }
}
