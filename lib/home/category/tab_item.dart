import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/theming.dart';

class TabItem extends StatelessWidget{

  Source source ;
  bool isSelected ;

  TabItem({required this.source , required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: MyTheme.primaryColor) ,
        borderRadius: BorderRadius.circular(30) ,
        color: isSelected == true ? MyTheme.primaryColor : Colors.transparent
      ),
      child: Text(source.name ?? "" , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold ,
      color: isSelected == true ? Colors.white : MyTheme.primaryColor),),
    );
  }
}