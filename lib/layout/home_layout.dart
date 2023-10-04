import 'package:ecommerce_trining/screen/accountpage.dart';
import 'package:ecommerce_trining/screen/offerpage.dart';
import 'package:flutter/material.dart';

import '../screen/cartpage.dart';
import '../screen/explore.dart';
import '../screen/homepage.dart';

class HomeLayOut extends StatefulWidget {
  const HomeLayOut({super.key});

  @override
  State<HomeLayOut> createState() => _HomeLayOutState();
}

class _HomeLayOutState extends State<HomeLayOut> {
  //متغير هياخد رقم الانديكس الخاص بالايتم بوتم بار
  int currentIndex = 0;

  //هعمل ليست للصفحات اللي هتنقل فيها علشان امررها للبوتن بار
  List<Widget> _screens = [
    HomePage(),
    ExplorePage(),
    CartPage(),
    OfferPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_sharp), label: "Offer"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: "Account"),
        ],

        //selectedIconTheme: IconThemeData(size: 31, color: Colors.amber),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        //value هو الانديكس اخاص بليست الايتم
        onTap: (value) {
          setState(() {
            currentIndex = value;
            print(value);
            print("currentindex = $currentIndex");
          });
        },
      ),
      //مررة المتغير اللي بياخد قيمة الانديكس الخاص بالتاب وخليته يبقي هو الايندكس
      //الخاص برده بالليست بحيث لما يبق في ايتم 0يعرض اسكرين رقم 0 وهكذا
      body: _screens[currentIndex],
    );
  }
}
