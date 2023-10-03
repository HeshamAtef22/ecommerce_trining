import 'package:flutter/material.dart';

import 'data.dart';
import 'loginhome.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //هعمل ليست للداتا اللي في  ميجا سيل Mega Sale List
  late List megasale;
  @override
  void initState() {
    megasale = flashsale.reversed.toList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Tabbar info
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          iconSize: 30,
          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(
            size: 35,
            color: buttoncolor,
          ),
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
          ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BackTheme(),
        child: ListView(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    //TextFormField for search box
                    child: TextFormField(
                      decoration: InputDecoration(
                        //TextFormField box size
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                        prefixIcon: Icon(Icons.search, color: buttoncolor),
                        border: OutlineInputBorder(),
                        hintText: "Search Product",
                      ),
                      //ظهور صفحة البحث عند الضغط علي التيكست فيلد
                      onTap: () {
                        showSearch(context: context, delegate: CustomSearch());
                      },
                    ),
                  ),
                  //الايقون الجانبية  بجوار التيكست فيلد
                  SizedBox(width: 5),
                  Icon(Icons.favorite_border, size: 24),
                  SizedBox(width: 5),
                  Stack(alignment: Alignment.topRight, children: [
                    Icon(Icons.notifications_none, size: 24),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red,
                      ),
                      height: 12,
                      width: 12,
                    )
                  ]),
                ],
              ),
            ),
            //Offer Banner
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Column(
                children: [
                  //1- هعمل كونتينر بالمساحة اللي عايزها علشان اعرض فيها الصور او مجموعة الويدجات اللي انا عايزها
                  //2-هعمل ليست ماب بداخلها تفاصيل المنتجات علشان اعرضها
                  Container(
                    height: 180,
                    child: PageView.builder(
                        itemCount: offers.length,
                        pageSnapping: true,
                        itemBuilder: (context, i) {
                          return offerstack(
                            offers[i]["image"],
                            offers[i]["title"],
                            offers[i]["timer"],
                          );
                        }),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                slideChoosePoint(Colors.black12),
                SizedBox(width: 4),
                slideChoosePoint(Colors.black12),
                SizedBox(width: 4),
                slideChoosePoint(buttoncolor),
                SizedBox(width: 4),
                slideChoosePoint(Colors.black12),
                SizedBox(width: 4),
                slideChoosePoint(Colors.black12),
              ],
            ),
            //Category list
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Category",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text("More Category",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: buttoncolor)),
              ],
            ),
            SizedBox(height: 5),
            //Category List Product
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: CategoryInfo.length,
                itemBuilder: (context, i) {
                  return Container(
                    child: Column(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 0.5),
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100)),
                          child: Image.asset(
                            CategoryInfo[i]["icon"],
                            height: 10,
                            width: 10,
                          ),
                          padding: EdgeInsets.all(25),
                        ),
                        SizedBox(height: 6),
                        SizedBox(
                          width: 90,
                          child: Text(
                            CategoryInfo[i]["title"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800]),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Flash Sale",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text("See More",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: buttoncolor)),
              ],
            ),
            //Flash Sale List
            SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: flashsale.length,
                itemBuilder: (context, i) {
                  return Container(
                    width: 140,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, top: 15, bottom: 8),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        decoration: TextDecoration.lineThrough),
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
                  );
                },
              ),
            ),

            //text Mega Sale
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mega Sale",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text("See More",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: buttoncolor)),
                ],
              ),
            ),
            //Mega Sale List
            SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: megasale.length,
                itemBuilder: (context, i) {
                  return Container(
                    width: 140,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, top: 15, bottom: 8),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 100,
                                child: Image.asset(
                                  megasale[i]["image"],
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                megasale[i]["title"],
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                megasale[i]["price"],
                                textAlign: TextAlign.end,
                                style: TextStyle(color: buttoncolor),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    megasale[i]["oldprice"],
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    megasale[i]["offer"],
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
                  );
                },
              ),
            ),
            //Image Product
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/product.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 10,
                    child: Text(
                      "Recomended \nProduct",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 10,
                    child: Text(
                      "We recommend the best for you",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            //list of product
            GridView.builder(
              //physics وقفت السكرول الخاص بالجريد فيو لاني بستخدم بالفعل سكرول للصفحة بالليست فيو
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: flashsale.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //mainAxisExtent علشان ازود مساحة البوكس اللي هيظهر فيه العناصر
                crossAxisCount: 2,
                mainAxisExtent: 240,
              ),
              itemBuilder: (context, i) {
                return Container(
                  width: 140,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, top: 15, bottom: 8),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 150,
                              child: Image.asset(
                                flashsale[i]["image"],
                                height: 100,
                                width: 150,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  flashsale[i]["oldprice"],
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      decoration: TextDecoration.lineThrough),
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
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

//هعمل كلاس للسيرش ديلجيت علشان امرره في السيرش بوكس
class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    //buildActions دي ليست بتحتوي علي ويدجيت ودا نفس الاكشن الموجود في الاب بار
    //فدا الاكشن او الجزئ الايمن من البوكس الخاص بالسيرش لما افتحه او اضغط عليه
    return [Icon(Icons.close)];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    //buildLeading دا نفس الليدنج اللي موجود بالاب بار بس هنا هيكون للبوكس الخاص بالسيرش واللي بيكون من نوع ويدجيت
    return IconButton(
        onPressed: () {
          //close فانكشن بيلد ان جاهز داخل السيرش ديليجيت ومهمته انه يقفل السيرش او يخرج منه
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    //buildResults الخاصة بنتيجة البحث
    return Text("Prodact");
  }

  //buildSuggestions الاقتراحات اللي بتكون مكتوبة تحت البوكس سيرش علشان تقترح علي اليوزر كلمات معينة تقدر تساعده في السيرش
  //زي ما بتعمل سيرش في الفيس او تويتر او يوتيوب او غيره
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
        child: ListView(children: [
      ...List.generate(40, (index) {
        return Text("product ${index}");
      }),
    ]));
  }
}

//ميثود للستاك الخاص باسلايد اوفر علشان امرر من خلاله القيم اليي موجوده في الليست اللي فيها الداتا بتاعتي
Widget offerstack(String image, String text, Row row) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Stack(
      alignment:
          AlignmentDirectional.bottomCenter, //التصورات هى خطأ حيث يضيف شك
      children: [
        Image.asset(
          image,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover, //fit : التصورات ينبغي أن تكون 100
          //fit: BoxFit.fitWidth,
        ),
        Positioned(
            top: 20,
            left: 20,
            width: 300,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black26),
            )),
        row,
      ],
    ),
  );
}

//ميثود خاصة بالدوائر الخاصة بالسلايد من الاسفل
Widget slideChoosePoint(Color color) {
  return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: EdgeInsets.only(right: 4),
        height: 10,
        width: 10,
        color: color,
      ));
}


