import 'package:flutter/material.dart';
import 'package:newzz/objects/news_model.dart';
import 'package:newzz/utils/custom_header.dart';

class NewsDetail extends StatelessWidget {
  Article news;
  NewsDetail(this.news);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar('Newzz', showAction: false,),
        body: NewsDetailBody(news),
      );
  }
}

class NewsDetailBody extends StatefulWidget {
  Article news;
  NewsDetailBody(this.news);

  @override
  _NewsDetailBodyState createState() => _NewsDetailBodyState(news);
}

class _NewsDetailBodyState extends State<NewsDetailBody> {
  Article news;
  _NewsDetailBodyState(this.news);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding( padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: IconButton(onPressed: () {Navigator.of(context).pop(true);},
            icon: Icon(Icons.keyboard_backspace, size: 32,), color: Colors.black54,),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 16, 30, 30),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(  //news heading
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red[300],
                      ),
                      child: Text(news.source.name[0].toUpperCase(),
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      width: 3,
                      height: 42,
                      decoration: BoxDecoration(color: Colors.black),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('10 Aug, 2020', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black54),),
                        Text(news.source.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 1),),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 22, 0, 4),
                    child: Text('${news.title}.', style: TextStyle(fontSize: 28, fontFamily: 'PlayfairDisplay', fontWeight: FontWeight.bold),)),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0,0,0,4),
                    child: IconButton(onPressed: () {},
                      icon: Icon(Icons.share), color: Colors.black54,),
                  ),
                ],),
                Image.network(news.urlToImage, width: 200,),
                Padding(padding: EdgeInsets.fromLTRB(0,20,0,16),
                    child: Text(news.description,
                      style: TextStyle(fontSize: 18, color: Colors.black54, letterSpacing: 0.5,
                          fontFamily: 'OpenSans'),)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('| Read More', style: TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 18, color: Colors.red[300]),),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

