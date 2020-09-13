import 'package:flutter/material.dart';
import 'package:newzz/news_details.dart';
import 'package:newzz/utils/api_manager.dart';
import 'package:newzz/utils/custom_header.dart';
import 'package:newzz/utils/custom_icons_icons.dart';
import 'package:newzz/utils/newslist_item.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

import 'objects/categories.dart';
import 'objects/news_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash()
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
    ()=>Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
            (context) =>
            MainScreen()
        )
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Newzz',
            style: TextStyle(
              color: Colors.black,
              fontSize: 42.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Category> newsCats = List();
  List<Article> newsList = List();

  Future<String> getListFromJson() async{
    var jsonString = await rootBundle.loadString('assets/news.json');
    setState(() {
      if (newsList.length>0) {newsList.clear();}
      newsList = ApiManager().parseJson(jsonString);
    });
  }

  @override
  void initState() {
    getListFromJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //main news categories
    newsCats.clear();
    newsCats.add(Category(Icon(CustomIcons.politics), 'Politics'));
    newsCats.add(Category(Icon(CustomIcons.films), 'Movies'));
    newsCats.add(Category(Icon(CustomIcons.tech), 'Science'));
    newsCats.add(Category(Icon(CustomIcons.sports), 'Sports'));

    return Scaffold(
      appBar: CustomAppBar('Newzz', actionIcon: Icon(CustomIcons.settings), showAction: true,),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              'Discover Latest\nNews',
              style: TextStyle(
                fontSize: 42,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 36, 0, 0),
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                      color: Colors.grey[200],
                    ),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search For News',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('search clicked');
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    margin: EdgeInsets.fromLTRB(8, 36, 0, 0),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                      color: Colors.red[300],
                    ),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 36, 0, 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: newsCats.map((category) {
                  return buildCategories(category);
                }).toList(),
              ),
            ),
            Text(
              'Popular Headlines',
              style: TextStyle(
                fontSize: 24,
                letterSpacing: 1,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: newsList.map((news) {
                return GestureDetector(
                  child: NewsListItem(news),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsDetail(news)),
                    );
                  },);
              }).toList()
              // children: [NewsListItem()],
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildCategories(category) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
          ),
          child: IconButton(
            onPressed: () {},
            icon: category.getCategoryIcon,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
          child: Text(
            category.getCategoryTitle,
            style:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
          ),
        )
      ],
    );
  }
}
