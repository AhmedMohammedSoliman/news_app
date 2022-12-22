import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home/category/singleNewsDetails.dart';

import '../../model/NewsResponse.dart';

class NewsItem extends StatelessWidget{

  News news ;
  NewsItem ({required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SingleNewsDetails.routeName ,
        arguments: {
          "title" : news.title ,
          "image" : news.urlToImage ,
          "content" : news.content ,
          "date" : news.publishedAt ,
          "author" : news.author ,
          "url" : news.url

        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30)
              ),
              child: Image(image: NetworkImage(news.urlToImage ?? ""),
            )
            ),
            Container(
              child: Text(news.author ??"" , style: TextStyle(fontSize: 18),),
            ),
            Container(
              child: Text(news.title ?? "" , style: TextStyle(fontWeight: FontWeight.bold ,
              fontSize: 20),),
            ) ,
            Container(
              child: Text(news.publishedAt ?? "" , textAlign: TextAlign.end,),
            )
          ],
        ),
      ),
    );
  }
}