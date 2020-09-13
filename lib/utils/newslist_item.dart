import 'package:flutter/material.dart';
import 'package:newzz/objects/news_model.dart';

class NewsListItem extends StatefulWidget {
  Article news;
  NewsListItem(this.news);

  @override
  _NewsListItemState createState() => _NewsListItemState(news);
}

class _NewsListItemState extends State<NewsListItem> {
  Article news;
  _NewsListItemState(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Row(
        children: [
          Container(
            width: 90.0,
            height: 90.0,
            decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey[300]),
                borderRadius: BorderRadius.circular(8),
                image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(news.urlToImage)
                )
            ),
          ),
          Container(
            width: 200,
            padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Column(
              children: [
                Text(
                  news.title,
                  style: TextStyle(
                    fontSize: 20, fontFamily: 'PlayfairDisplay', color: Colors.black, fontWeight: FontWeight.bold
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,8,0,0),
                  child: Row(
                    children: [
                      Text(news.source.name, style: TextStyle(fontSize: 13),),
                      Text(' • 12 Aug, 2020'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
