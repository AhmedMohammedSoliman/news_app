import 'package:flutter/material.dart';
import 'package:news_app/home/category/newsItem.dart';
import 'package:news_app/home/category/news_widget_view_model.dart';
import 'package:news_app/model/SourceResponse.dart';

import '../../model/NewsResponse.dart';
import '../../model/api_funs.dart';

class NewsContainer extends StatefulWidget{
  Source source ;
  NewsContainer ({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsWidgetViewModel newsWidgetViewModel = NewsWidgetViewModel();
  var controller = ScrollController();
  bool shouldLoadingNextPage = false ;
  List<News> newsList = [];
  int oldPage = 1 ;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.atEdge){
        bool isTop = controller.position.pixels == 0 ;
        if (!isTop){
          shouldLoadingNextPage = true ;
          setState((){});
        }
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if (shouldLoadingNextPage == true){
      ApiManager.getNews(sourceId: widget.source.id ?? "" , page: ++oldPage).then((newsResponse) {
        newsList.addAll(newsResponse.articles ?? []);
        shouldLoadingNextPage = false ;
        setState((){});
      });
    }return FutureBuilder<NewsResponse>(
        future: newsWidgetViewModel.getNewsFun(sourceId: widget.source.id ?? ""),
        builder: (context , snapshot){
          if (snapshot.hasError){
            return Column(
              children: [
                Text(snapshot.error.toString()) ,
                ElevatedButton(
                    onPressed: (){
                      ApiManager.getNews(sourceId: widget.source.id ?? "");
                    }, child: Text("Try again"))
              ],
            );
          }
          if (snapshot.data?.status == "ok"){
            if(newsList.isEmpty){
              newsList = snapshot.data?.articles ?? [] ;
            }else if (newsList[0].title != snapshot.data?.articles![0].title){
              newsList = snapshot.data?.articles ?? [] ;
            }
            return Expanded(
              child: ListView.builder(
                  itemCount: newsList.length,
                  controller: controller,
                  itemBuilder: (context , index){
                    return  NewsItem(news: newsList[index]) ;
                  }),
            );
          }
          else if (snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
          }
          return Text(snapshot.data?.message ?? "") ;
          }) ;

  }
}