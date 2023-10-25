import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../data.dart';
import '../login/loginhome.dart';
import '../screens/product_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//دا متغير بيتغير خاص بالسليد بتتغير قيمته مع قيمة الانديكس الخاصة بالليست
int _currentindex = 0;

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
        decoration: BackTheme(),
        child: ListView(
          children: [
              //TextFormField for search box
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
            //Offer Banner slider
            Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: CarouselSlider.builder(
                  itemCount: offers.length,
                  itemBuilder: (context, index, realIndex) {
                    return OfferStackWidget(
                      image: offers[index]["image"],
                      text: offers[index]["title"],
                      row: offers[index]["timer"],
                    );
                  },
                  options: CarouselOptions(
                      initialPage: 0,
                      height: 200.0,
                      //viewportFraction نسبة ظهور العنصر ع الشاشة
                      viewportFraction: 1,
                      //enlargeCenterPage تكبير الصورة اللي في المنتصف
                      enlargeCenterPage: true,
                      //autoPlay التحريك الاوتوامتيك
                      autoPlay: true,
                      //autoPlayInterval مدة التغير بين كل صورة واخري
                      autoPlayInterval: Duration(seconds: 2),
                      //enableInfiniteScroll دي بخلي السكرول ملوش اخر يعني زي نظام الدائرة
                      //لو عملته فولس فاول ما يوصل لاخر انديكس هيرجع للانديكس الاول ويبدأاسكرول من الاول وهكذا
                      enableInfiniteScroll: true,
                      //scrollDirection اتجاه السكرول
                      onPageChanged: (index, reason) {
                        //همرر قيمة لانديكس للمتغير علشان كل ما يتغير الاندكس يتغير معه قيمة المتغير
                        setState(() {
                          _currentindex = index;
                        });
                      }),
                )),
            //slideChoosePoint
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                slideChoosePoint(3),
                slideChoosePoint(2),
                slideChoosePoint(1),
                slideChoosePoint(0),
              ],
            ),
            SizedBox(height: 5),
            //Category list
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Category",
                    style: Theme.of(context).textTheme.headlineMedium),
                Text("More Category",
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
            SizedBox(height: 10),
            //Category List Product
            SizedBox(
              height: 125,
              child: ListView.separated(
                //الميثود اللي بتعمل لوب علشان تعمل فاصل ع حسب عدد العناصر ودي اجبارية
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * .02);
                },
                scrollDirection: Axis.horizontal,
                itemCount: CategoryInfo.length,

                itemBuilder: (context, i) {
                  return customCircularCategory(
                      CategoryInfo[i]["icon"], CategoryInfo[i]["title"]);
                },
              ),
            ),



            //Flash Sale List
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Flash Sale",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text("See More",
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
            SizedBox(height: 5),
            //ListView.separated استخدمتها هنا علشان اعمل فاصلبين العناصر عن طريق الميدياكويري
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
                  return GestureDetector(
                    child: Hero(
                      tag: flashsale[i]["title"],
                      child: Container(
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
                                    maxLines: 2,overflow: TextOverflow.ellipsis,
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
                    ),
                    onTap: () {
                      //عملت نافيجتور تنقلني لصفحة الديتيلز وعن طريق المتغير اللي اسمه داتا اللي في صفحة الديتيلز
                      //همرر من خلاله الداتا اللي عايز اعرضها
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDetail(data: flashsale[i]),
                      ));
                    },
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
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text("See More",
                      style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),
            //Mega Sale List
            SizedBox(
              height: 240,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * .02);
                },
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
                          fontSize: MediaQuery.of(context).size.width * .05,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    left: 10,
                    child: Text(
                      "We recommend the best for you",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * .05,
                      ),
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

//عملت كاستم ويدجيت للدوائر اللي تحت السليدر وهممر من خلالها الانديكس
Container slideChoosePoint(int indexnum) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 2),
    //هتحكم في حجم الكونتينر عن طريق المتغير والانديكس بحيث ان لما المتغير يكون بيساوي الانديكس ياخد حجم معين
    height: _currentindex == indexnum ? 15 : 10,
    width: _currentindex == indexnum ? 15 : 10,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        border: Border.all(width: .3),
        borderRadius: BorderRadius.circular(20),
        color:
            _currentindex == indexnum ? Colors.lightBlue : Colors.transparent),
  );
}
