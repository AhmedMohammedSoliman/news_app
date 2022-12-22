import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/home/category/categoryItem.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
class ApiManager {

  static const String baseServer = "newsapi.org";
 
 static Future<SourceResponse> getSources (String categoryId)async{
    //https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
    var url = Uri.https(baseServer, "/v2/top-headlines/sources" , {
      "apiKey" : "522be7642e834ec298a861dd93095500" ,
      "category" : categoryId
    });
   try {
     var response = await http.get(url);
     var body =  response.body ;
     var json = jsonDecode(body);
     var sourceResponse = SourceResponse.fromJson(json);
     return sourceResponse ;
   }catch(e){
     throw(e);
   }


  }
  
 static Future<NewsResponse> getNews (String sourceId, {int page = 0})async{
   //https://newsapi.org/v2/everything?q=bitcoin&apiKey=522be7642e834ec298a861dd93095500
   var url = Uri.https(baseServer, "/v2/everything" , {
     "q" : "bitcoin" ,
     "apiKey" : "522be7642e834ec298a861dd93095500"
   });
  try {
    var response = await http.get(url);
    var body =  response.body ;
    var json = jsonDecode(body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse ;
  }catch(e){
    throw(e);
  }

   }
}