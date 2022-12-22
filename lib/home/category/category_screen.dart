import 'package:flutter/material.dart';

import 'categoryItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryScreen extends StatelessWidget{
// business  entertainment  general  health  science  sports
  List<CategoryItem> categoryList = [
    CategoryItem(image: "assets/images/sports.png", title: "Sports", borderRadiusLift: Radius.circular(20), borderRadiusRight: Radius.circular(0) , color: Colors.blue, id: "sports",),
    CategoryItem(image: "assets/images/Politics.png", title: "General", borderRadiusLift: Radius.circular(0), borderRadiusRight: Radius.circular(20) , color: Colors.deepOrange, id: "general",),
    CategoryItem(image: "assets/images/health.png", title: "Health", borderRadiusLift: Radius.circular(20), borderRadiusRight: Radius.circular(0) , color: Colors.orange, id: "health",),
    CategoryItem(image: "assets/images/environment.png", title: "Environment", borderRadiusLift: Radius.circular(0), borderRadiusRight: Radius.circular(20) , color: Colors.green, id: "entertainment",),
    CategoryItem(image: "assets/images/bussines.png", title: "Business", borderRadiusLift: Radius.circular(20), borderRadiusRight: Radius.circular(0) , color: Colors.deepPurple, id: "business",),
    CategoryItem(image: "assets/images/science.png", title: "Science", borderRadiusLift: Radius.circular(0), borderRadiusRight: Radius.circular(20), color: Colors.brown, id: "science",),
  ];
  Function onItemClick ;
  CategoryScreen({required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text( AppLocalizations.of(context)!.pick, style: TextStyle(
            color: Color(0xff4F5A69) , fontWeight: FontWeight.bold , fontSize: 22)
          ),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2 ,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
                ),
                itemBuilder: (context , index) => InkWell(
                  onTap: (){
                    onItemClick(categoryList[index]);
                  }
                  ,
                  child: CategoryItem(
                      image: categoryList[index].image,
                      title: categoryList[index].title,
                      borderRadiusLift: categoryList[index].borderRadiusLift,
                      borderRadiusRight: categoryList[index].borderRadiusRight ,
                  color: categoryList[index].color,
                  id: categoryList[index].id,),
                ) ,
            itemCount: categoryList.length,),
          )
        ],
      ),
    );
  }
}