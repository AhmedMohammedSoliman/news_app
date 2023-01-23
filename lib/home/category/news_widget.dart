import 'package:flutter/material.dart';
import 'package:news_app/home/category/newsItem.dart';
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
  int pageNumber = 0;
  final ScrollController scrollController = ScrollController();
  bool atBottom = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
          bool isTop = scrollController.position.pixels == 0;
          if (!isTop) {
            atBottom = true;
            setState(() {});
          }
        }
      }
    });
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: !atBottom
        ?ApiManager.getNews(sourceId: widget.source.id ?? ""):
        ApiManager.getNews(
           sourceId: widget.source.id ?? "", page: ++pageNumber),
        builder: (context , snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }else if (snapshot.hasError){
            return Column(
              children: [
                Text("SomeThing went wrong") ,
                ElevatedButton(
                    onPressed: (){
                      ApiManager.getNews(sourceId: widget.source.id ?? "");
                    }, child: Text("Try again"))
              ],
            );
          }
          if (snapshot.data?.status == "ok"){
            var newsList = snapshot.data?.articles ?? [] ;
            return Expanded(
              child: ListView.builder(
                  itemCount: newsList.length,
                  controller: scrollController,
                  itemBuilder: (context , index){
                    return  NewsItem(news: newsList[index]) ;
                  }),
            );
          } return Text(snapshot.data?.message ?? "") ;
        }) ;
  }
}