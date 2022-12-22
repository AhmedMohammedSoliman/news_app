import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget{
  String image ;
  String title ;
  Radius borderRadiusLift ;
  Radius borderRadiusRight;
  Color color ;
  String id ;

  CategoryItem({required this.image , required this.title , required this.borderRadiusLift
  ,required this.borderRadiusRight , required this.color , required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20) ,
        topLeft: Radius.circular(20) , bottomRight: borderRadiusRight , bottomLeft: borderRadiusLift)
      ),
      child: Column(
        children: [
          Image(image: AssetImage(image) , height: 120) ,
          Text(title , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),)
        ],

      ),
    );
  }
}