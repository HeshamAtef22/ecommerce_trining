 //ليست للداتا داخل الكاتيجوري
  import 'package:flutter/material.dart';

List CategoryInfo = [
    {
      "icon": "assets/images/manshirt.png",
      "title": "Man Shirt",
    },
    {
      "icon": "assets/images/dress.png",
      "title": "Dress",
    },
    {
      "icon": "assets/images/eqbag.png",
      "title": "Man Work Equipment",
    },
    {
      "icon": "assets/images/wobag.png",
      "title": "Woman Bag",
    },
    {
      "icon": "assets/images/manshoes.png",
      "title": "Man Shoes",
    },
    {
      "icon": "assets/images/highheel.png",
      "title": "High Heels",
    },
  ];


//list flash Sale data
  List flashsale = [
    {
      "image": "assets/images/sale1.jpg",
      "title": "FS - Nike Air Max 270 React...",
      "price": "\$280",
      "oldprice": "\$555.63",
      "offer": "25% off"
    },
    {
      "image": "assets/images/sale2.jpg",
      "title": "Canon -camera 4k max...",
      "price": "\$190",
      "oldprice": "\$360.70",
      "offer": "20% off"
    },
    {
      "image": "assets/images/sale7.png",
      "title": "Sauvage by dior for men - edp 100 ml ",
      "price": "\$170",
      "oldprice": "\$320.47",
      "offer": "22% off"
    },
    {
      "image": "assets/images/sale3.jpg",
      "title": "HandBag queende25 nice wear...",
      "price": "\$170",
      "oldprice": "\$320.47",
      "offer": "22% off"
    },
    {
      "image": "assets/images/sale4.jpg",
      "title": "Brand: Generic Sabo Shoes For Women",
      "price": "\$170",
      "oldprice": "\$320.47",
      "offer": "22% off"
    },
    {
      "image": "assets/images/sale6.jpg",
      "title": "Hero Basic Mens V-Neck T-shirt",
      "price": "\$170",
      "oldprice": "\$320.47",
      "offer": "22% off"
    },
  ];
  


    //ليست بالمنتجات المراد عرضها في البانر العلوي الخاص بالخصومات والعروض
  List offers = [
    {
      "image": "assets/images/shoes.jpg",
      "title": "Super Flash Sale 50% Off",
      "timer": Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: 45,
              child: Text(
                "08",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
            ),
          ),
          Text(
            ":",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: 45,
              child: Text(
                "34",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
            ),
          ),
          Text(
            ":",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: 45,
              child: Text(
                "52",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    },
    {
      "image": "assets/images/sunglass.jpg",
      "title": "Super Flash Sale 50% Off",
      "timer": Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: 45,
              child: Text(
                "08",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
            ),
          ),
          Text(
            ":",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: 45,
              child: Text(
                "34",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
            ),
          ),
          Text(
            ":",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: 45,
              child: Text(
                "52",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    },
    {
      "image": "assets/images/1.png",
      "title": "Super Flash Sale 50% Off",
      "timer": Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: 45,
              child: Text(
                "08",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
            ),
          ),
          Text(
            ":",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: 45,
              child: Text(
                "34",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
            ),
          ),
          Text(
            ":",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 18, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              height: 45,
              width: 45,
              child: Text(
                "52",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    },
  ];

  //الثيم الخاص بالخلفية
BoxDecoration BackTheme() {

  return BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.purple.shade100,
            Colors.purple.shade200,
            Colors.blue.shade800,
          ],
          end: Alignment.topLeft,
          tileMode: TileMode.clamp,
          begin: Alignment.center,
          transform: const GradientRotation(120),
          stops: [0.1, 0.3, 0.5, 1]));
}


