import 'package:flutter/cupertino.dart';

class Category {

  Icon mCatIcon;
  String mCatTitle;

  Category(Icon mCatIcon, String mCatTitle){
    this.mCatIcon = mCatIcon;
    this.mCatTitle = mCatTitle;
  }

  Icon get getCategoryIcon => mCatIcon;

  String get getCategoryTitle => mCatTitle;
}