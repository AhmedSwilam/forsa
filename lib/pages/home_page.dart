import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:forsa/Models/main_category.dart';
import 'package:forsa/classes/language.dart';
import 'package:forsa/localization/localization_constant.dart';
import 'package:forsa/pages/about_page.dart';
import 'package:forsa/pages/call_us_page.dart';
import 'package:forsa/pages/login_page.dart';
import 'package:forsa/pages/new_offers_page.dart';
import 'package:forsa/pages/second_page.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}


class _HomePageState extends State<HomePage> {
  void _changeLanguage(Language language) async {
    Locale _temporaryLanguage = await setLocale(language.languageCode);
    MyApp.setLocale(context, _temporaryLanguage);
  }
  List<MainCategoriesModel> futureCategories;
  Future<List<MainCategoriesModel>> getAllMainCategories() async {
    var url = "http://weddingapp-001-site1.atempurl.com/api/Categories";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<MainCategoriesModel> mainCategory =
          mainCategoriesModelFromJson(response.body);
      return mainCategory;
//        MainCategoriesModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('*please check your internet*');
    }
  }

  @override
  void initState() {
    super.initState();
    getAllMainCategories().then((allCategories) {
      setState(() {
        futureCategories = allCategories;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 180.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/1.png'),
          AssetImage('assets/2.png'),
          AssetImage('assets/3.png'),
          AssetImage('assets/4.png'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 3.0,
        dotColor: Colors.grey,
        indicatorBgPadding: 2.0,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: <Widget>[
//          IconButton(icon: Icon(Icons.search), onPressed: () {}),
//          IconButton(icon: Icon(Icons.notifications_active), onPressed: () {}),
          DropdownButton(
            onChanged: (Language language) {
              _changeLanguage(language);
            },
            underline: SizedBox(),
            icon: Icon(
              Icons.language,
              color: Colors.white,
            ),
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                      value: lang,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  lang.flag,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  lang.name,
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
//          GestureDetector(onTap: () {},
//              child: Icon(Icons.search)),
//          GestureDetector(onTap: () {},
//              child: Icon(Icons.notifications_active)),
        ],
        centerTitle: true,
        title: Text(getTranslated(context, 'title')),
      ),
      drawer: Container(
        // put drawer inside container to give it width
        width: 250,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    image: DecorationImage(
                        image: AssetImage("assets/2.png"), fit: BoxFit.cover)),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage("assets/facebook1.png"),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        getTranslated(context, 'drawerheader'),
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    )
                  ],
                ),
              ),
              ListTile(
                title: Text(getTranslated(context, 'drawerListHomePage')),
                leading: Icon(
                  Icons.home,
                  color: Colors.lightGreen,
                ),
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage())),
              ),
              ListTile(
                title: Text(getTranslated(context, 'login')),
                leading: Icon(
                  Icons.launch,
                  color: Colors.lightGreen,
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
              ListTile(
                title: Text(getTranslated(context, 'newOffers')),
                leading: Icon(
                  Icons.new_releases,
                  color: Colors.lightGreen,
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => NewOffersPage()));
                },
              ),
              ListTile(
                title: Text(getTranslated(context, 'aboutforsa')),
                leading: Icon(
                  Icons.account_box,
                  color: Colors.lightGreen,
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AboutPage()));
                },
              ),
              ListTile(
                title: Text(getTranslated(context, 'callUs')),
                leading: Icon(
                  Icons.call,
                  color: Colors.lightGreen,
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => CallUs()));
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            imageCarousel,
            Text(getTranslated(context, 'categories'),
                style: TextStyle(fontSize: 20, color: Colors.green)),
            Expanded(
              child: FutureBuilder(
                future: getAllMainCategories(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<MainCategoriesModel>> snapshot) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount:
                        null == futureCategories ? 0 : futureCategories.length,
                    itemBuilder: (BuildContext context, int index) {
                      MainCategoriesModel categoriesModel =
                          futureCategories[index];
                      return Card(
                        color: Colors.lightGreenAccent,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondPage(categoriesModel.id)));
                          },
                          child: Column(
                            children: <Widget>[
                              Image(
                                image: NetworkImage(
                                    "http://weddingapp-001-site1.atempurl.com" +
                                        categoriesModel.photo),
                                fit: BoxFit.fill,
                              ),

                              Text("${categoriesModel.nameEn}"),
                              Text("${categoriesModel.nameAr}"),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                  //          GestureDetector(onTap: () {},
//              child: Icon(Icons.search)),
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
