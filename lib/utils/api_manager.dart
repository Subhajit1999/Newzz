import 'package:newzz/objects/news_model.dart';

class ApiManager {

  List<Article> parseJson(String response) {  //converts Json String to list of Objects
    if(response == null){
      return [];
    }
    return newsObjectFromJson(response).articles;
  }
}