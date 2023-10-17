import 'package:ecommerce_trining/modules/home/homepage.dart';
import 'package:ecommerce_trining/modules/login/loginhome.dart';
import 'package:flutter/material.dart';

import '../../data.dart';

class ProductDetail extends StatefulWidget {
  final data;
  const ProductDetail({super.key, this.data});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  //متغير لاختيار حجم البروداكت
  int size = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BackTheme(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.data["title"],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    //product image
                    bannarImage(context, widget.data["image"]),

                    SizedBox(height: 10),
                    //slider point
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        slideChoosePoint(0),
                        slideChoosePoint(1),
                        slideChoosePoint(2),
                        slideChoosePoint(3),
                      ],
                    ),

                    SizedBox(height: 10),
                    //Product title and icon Favorite and rating stars and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Product title and icon Favorite
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .75,
                              child: Text(
                                widget.data["title"],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.favorite_border)),
                          ],
                        ),

                        //rating stars
                        Row(
                          children: [
                            Icon(Icons.star,
                                size: 25,
                                color: Color.fromRGBO(255, 200, 51, 1)),
                            Icon(Icons.star,
                                size: 25,
                                color: Color.fromRGBO(255, 200, 51, 1)),
                            Icon(Icons.star,
                                size: 25,
                                color: Color.fromRGBO(255, 200, 51, 1)),
                            Icon(Icons.star,
                                size: 25,
                                color: Color.fromRGBO(255, 200, 51, 1)),
                            Icon(Icons.star, size: 25, color: Colors.grey),
                          ],
                        ),
                        SizedBox(height: 10),
                        //product Price
                        Text(
                          widget.data["price"],
                          style: TextStyle(
                              color: Color.fromRGBO(64, 191, 255, 1),
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),

                    SizedBox(height: 15),
                  ],
                ),

                //product select size
                Text(
                  "select size",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      circularSelectSize("7", .5),
                      circularSelectSize("8", .5),
                      circularSelectSize("9.5", 3),
                      circularSelectSize("11", .5),
                      circularSelectSize("12", .5),
                      circularSelectSize("12.5", .5),
                      circularSelectSize("13", .5),
                      circularSelectSize("14", .5),
                      circularSelectSize("15", .5),
                      circularSelectSize("16", .5),
                    ],
                  ),
                ),

                SizedBox(height: 15),
                //select Color
                Text(
                  "Select Color",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      circularSelectColor(false, Colors.red),
                      circularSelectColor(true, Colors.green),
                      circularSelectColor(false, Colors.yellow),
                      circularSelectColor(false, Colors.black),
                      circularSelectColor(false, Colors.blue),
                      circularSelectColor(false, Colors.brown),
                      circularSelectColor(false, Colors.amber),
                      circularSelectColor(false, Colors.blueGrey),
                    ],
                  ),
                ),

                SizedBox(height: 15),
                //product Specification
                Text(
                  "Specification",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 10),
                Container(
                  //color: Colors.amber.shade400,
                  //height: MediaQuery.of(context).size.height * .35,
                  width: MediaQuery.of(context).size.width * .95,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Shown
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            height: MediaQuery.of(context).size.height * .10,
                            child: Text("Shown:"),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .40,
                            height: MediaQuery.of(context).size.height * .10,
                            child: Text(
                                'Laser Blue/Anthracite/Watermelon/White',
                                style: Theme.of(context).textTheme.bodySmall,
                                textAlign: TextAlign.right),
                          )
                        ],
                      ),

                      //style
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Style :"),
                          appTextTheme(text: "CD0113-400"),
                        ],
                      ),

                      SizedBox(height: 10),
                      Text(
                        widget.data["info"],
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                //Review Product
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * .95,
                  height: MediaQuery.of(context).size.height * .45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          headLineText("Review Product"),
                          Text(
                            "See More",
                            style: TextStyle(
                                color: buttoncolor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      //rating stars
                      Row(
                        children: [
                          Icon(Icons.star,
                              size: 22, color: Color.fromRGBO(255, 200, 51, 1)),
                          Icon(Icons.star,
                              size: 22, color: Color.fromRGBO(255, 200, 51, 1)),
                          Icon(Icons.star,
                              size: 22, color: Color.fromRGBO(255, 200, 51, 1)),
                          Icon(Icons.star,
                              size: 22, color: Color.fromRGBO(255, 200, 51, 1)),
                          Icon(Icons.star, size: 22, color: Colors.grey),
                          SizedBox(width: 15),
                          appTextTheme(text: "4.5 (5 Review)"),
                        ],
                      ),
                      //review user pic and username and  stars
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/user1.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              headLineText("Alisson Joca"),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      size: 22,
                                      color: Color.fromRGBO(255, 200, 51, 1)),
                                  Icon(Icons.star,
                                      size: 22,
                                      color: Color.fromRGBO(255, 200, 51, 1)),
                                  Icon(Icons.star,
                                      size: 22,
                                      color: Color.fromRGBO(255, 200, 51, 1)),
                                  Icon(Icons.star,
                                      size: 22,
                                      color: Color.fromRGBO(255, 200, 51, 1)),
                                  Icon(Icons.star,
                                      size: 22, color: Colors.grey),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),

                      //user Comment
                      SizedBox(height: 10),
                      Text(
                        "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black54),
                      ),

                      SizedBox(height: 8),
                      Row(
                        children: [
                          Image.asset("assets/images/sale2.jpg",
                              width: 75, height: 75),
                          SizedBox(width: 8),
                          Image.asset("assets/images/sale7.png",
                              width: 75, height: 75),
                          SizedBox(width: 8),
                          Image.asset("assets/images/sale6.jpg",
                              width: 75, height: 75),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text("December 10, 2023")
                    ],
                  ),
                ),

                //You Might Also Like
                headLineText("headLineText"),
                SizedBox(height: 10),
                SizedBox(
                  height: 240,
                  child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          width: MediaQuery.of(context).size.width * .02);
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: flashsale.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        child: Container(
                          width: 140,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, left: 10, top: 15, bottom: 8),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      child: Image.asset(
                                        flashsale[i]["image"],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      flashsale[i]["title"],
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                      flashsale[i]["price"],
                                      textAlign: TextAlign.end,
                                      style: TextStyle(color: buttoncolor),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          flashsale[i]["oldprice"],
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 10,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        SizedBox(width: 7),
                                        Text(
                                          flashsale[i]["offer"],
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        onTap: () {
                          //عملت نافيجتور تنقلني لصفحة الديتيلز وعن طريق المتغير اللي اسمه داتا اللي في صفحة الديتيلز
                          //همرر من خلاله الداتا اللي عايز اعرضها
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ProductDetail(data: flashsale[i]),
                          ));
                        },
                      );
                    },
                  ),
                ),

                SizedBox(height: 15),
                ElevatedButton(onPressed: () {}, child: Text("Add To Cart")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Custom Widget For  circularSelectSize Container
Container circularSelectSize(String sizetype, double bordarwidth) {
  return Container(
    height: 48,
    width: 48,

    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
        color: const Color.fromARGB(50, 234, 224, 224),
        border: Border.all(width: bordarwidth, color: buttoncolor),
        borderRadius: BorderRadius.circular(100)),
    child: Center(child: Text(sizetype)),
    //padding: EdgeInsets.all(20),
  );
}

//Custom Widget For  circularSelectColor Container
Container circularSelectColor(bool selected, Color color) {
  return Container(
    height: 48,
    width: 48,

    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
        color: color,
        border: Border.all(width: .1),
        borderRadius: BorderRadius.circular(100)),
    child: Center(
      child: selected == true
          ? Icon(Icons.circle, color: Colors.white, size: 18)
          : null,
    ),
    //padding: EdgeInsets.all(20),
  );
}
