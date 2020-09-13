import 'package:flutter/material.dart';
import 'package:newzz/utils/custom_header.dart';

class NewsDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar('Newzz', showAction: false,),
        body: NewsDetailBody(),
      ),
    );
  }
}

class NewsDetailBody extends StatefulWidget {
  @override
  _NewsDetailBodyState createState() => _NewsDetailBodyState();
}

class _NewsDetailBodyState extends State<NewsDetailBody> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

