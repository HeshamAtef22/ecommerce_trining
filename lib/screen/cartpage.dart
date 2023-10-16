// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ecommerce_trining/screen/loginhome.dart';

import '../data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

//هعمل متغير اتحكم من خلاله في العدد المطلوب من البروداكت داخل الكارد
int counter = 1;

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BackTheme(),
      child: Scaffold(
        appBar: AppBar(title: Text('Your Cart')),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Column(
                children: [
                  // create Card contain image and title and 2 icon and price and 2 icon buttom
                  cardOfProduct(
                    imagetext: "assets/images/sale1.jpg",
                    title: "FS - Nike Air Max 270 React...",
                    price: "\$280",
                  ),
                  SizedBox(height: 10),
                  cardOfProduct(
                    imagetext: "assets/images/sale1.jpg",
                    title: "FS - Nike Air Max 270 React...",
                    price: "\$280",
                  ),

                  SizedBox(height: 15),
                  //TextField cupon and apply Button
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.white38,
                    // width: 100,
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 70,
                            //width: MediaQuery.of(context).size.width * .95,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Enter Cupon Code",
                                  suffixIcon: MaterialButton(
                                    minWidth:
                                        MediaQuery.of(context).size.width * .20,
                                    height: double.maxFinite,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.horizontal(
                                          right: Radius.circular(5)),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Apply",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    color: buttoncolor,
                                  ),
                                  suffixStyle: TextStyle(color: Colors.amber)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Total order
                  Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.white,
                    height: 165,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("items(2)"),
                            Text("560\$"),
                          ],
                        ),
                        Divider(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Shipping"),
                            Text("60\$"),
                          ],
                        ),
                        Divider(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Import charges"),
                            Text("110\$"),
                          ],
                        ),
                        Divider(height: 20, thickness: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Price",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "500\$",
                              style: TextStyle(color: buttoncolor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),
                  //Check Out button
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Check Out"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Create class Card contain image and title and 2 icon and price and 2 icon buttom
class cardOfProduct extends StatefulWidget {
  final String imagetext;
  final String title;
  final String price;

  const cardOfProduct({
    Key? key,
    required this.imagetext,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  State<cardOfProduct> createState() => _cardOfProductState();
}

class _cardOfProductState extends State<cardOfProduct> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white38,
      padding: EdgeInsets.all(5),
      height: 150,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            //image in card
            Image.asset(widget.imagetext),
            SizedBox(width: 5),
            // ثاني جزي في الكارد وهو عبارة عن كولوم فيه العنوان والسعر اسفل منه
            SizedBox(
              width: MediaQuery.of(context).size.width * .35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title),
                  Text(
                    widget.price,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: buttoncolor),
                  ),
                ],
              ),
            ),
            Spacer(),
            //ثالث جزء من الكارد عبارة عن 2 ايقون بوتن ف الاعلي وفي الاسفل 2بوتن وكونتينر لزيادة عدد
            //العنصر المشتري او تقليله
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //الجزء الخاص باليقونات
                  Row(
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Icon(Icons.favorite, color: Colors.red)),
                      SizedBox(width: 10),
                      InkWell(onTap: () {}, child: Icon(Icons.delete)),
                    ],
                  ),
                  //الجزء الخاص بعدد القطع والتحكم فيها بزيادة او نقص
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white, border: Border.all(width: .2)),
                        height: 25,
                        width: 25,
                        child: InkWell(
                          child: Icon(Icons.remove),
                          onTap: () {
                            setState(() {
                              if (counter <= 1) {
                                counter == 1;
                              } else {
                                counter--;
                              }
                            });
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(width: .2)),
                        child: Center(child: Text("$counter")),
                        width: 25,
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white, border: Border.all(width: .2)),
                        height: 25,
                        width: 25,
                        child: InkWell(
                          child: Icon(Icons.add),
                          onTap: () {
                            setState(() {
                              counter++;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* // create Card contain image and title and 2 icon and price and 2 icon buttom
Container cardOfProduct(
    BuildContext context, String imagetext, String title, String price) {
  return Container(
    color: Colors.white38,
    padding: EdgeInsets.all(5),
    height: 150,
    child: Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          //image in card
          Image.asset(imagetext),
          SizedBox(width: 5),
          // ثاني جزي في الكارد وهو عبارة عن كولوم فيه العنوان والسعر اسفل منه
          SizedBox(
            width: MediaQuery.of(context).size.width * .35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(
                  price,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: buttoncolor),
                ),
              ],
            ),
          ),
          Spacer(),
          //ثالث جزء من الكارد عبارة عن 2 ايقون بوتن ف الاعلي وفي الاسفل 2بوتن وكونتينر لزيادة عدد
          //العنصر المشتري او تقليله
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //الجزء الخاص باليقونات
                Row(
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Icon(Icons.favorite, color: Colors.red)),
                    SizedBox(width: 10),
                    InkWell(onTap: () {}, child: Icon(Icons.delete)),
                  ],
                ),
                //الجزء الخاص بعدد القطع والتحكم فيها بزيادة او نقص
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, border: Border.all(width: .2)),
                      height: 25,
                      width: 25,
                      child: InkWell(child: Icon(Icons.remove)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          border: Border.all(width: .2)),
                      child: Center(child: Text("1")),
                      width: 25,
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white, border: Border.all(width: .2)),
                      height: 25,
                      width: 25,
                      child: InkWell(child: Icon(Icons.add)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
} */
