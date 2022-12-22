import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home/category/categoryItem.dart';
import 'package:news_app/home/category/news_widget.dart';
import 'package:news_app/home/category/tabs_controller.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/api_funs.dart';

class CategoryDetails extends StatelessWidget {
  CategoryItem categoryitem ;
  CategoryDetails({required this.categoryitem});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<SourceResponse>(
            future: ApiManager.getSources(categoryitem.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("Something went wrong"),
                    ElevatedButton(
                        onPressed: () {
                          ApiManager.getSources(categoryitem.id);
                        },
                        child: Text("Try again"))
                  ],
                );
              }
              var sourceList = snapshot.data?.sources ?? [];

              if (snapshot.data?.status == "ok") {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search article",
                            hintStyle: TextStyle(color: Colors.white),
                            filled: true ,
                            fillColor: Colors.grey,
                            suffixIcon: Icon(Icons.search , size: 30,),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Tabs(sourcesList: sourceList)
                    ],
                  ),
                );
              } return Column(
                children: [
                  Text(snapshot.data?.message ?? ""),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getSources(categoryitem.id);
                      },
                      child: Text("Try again"))
                ],
              );

            }) ,

      ],
    );
  }
}
