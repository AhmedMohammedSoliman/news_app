import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home/category/categoryDetailsViewModel.dart';
import 'package:news_app/home/category/categoryItem.dart';
import 'package:news_app/home/category/news_widget.dart';
import 'package:news_app/home/category/tabs_controller.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_funs.dart';

class CategoryDetails extends StatefulWidget {
  CategoryItem categoryitem ;
  CategoryDetails({required this.categoryitem});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

  CategoryDetailsViewModel categoryDetailsViewModel = CategoryDetailsViewModel();
  @override
  void initState() {
    categoryDetailsViewModel.categoryItem = widget.categoryitem;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: categoryDetailsViewModel.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.categoryitem.id);
                    },
                    child: Text("Try again"))
              ],
            );
          }
          var sourceList = snapshot.data?.sources ?? [];

          if (snapshot.data?.status == "ok") {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Tabs(sourcesList: sourceList),
            );
          } return Column(
            children: [
              Text(snapshot.data?.message ?? ""),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources(widget.categoryitem.id);
                  },
                  child: Text("Try again"))
            ],
          );

        });
  }
}
