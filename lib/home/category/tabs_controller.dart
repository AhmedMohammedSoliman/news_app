import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home/category/news_widget.dart';
import 'package:news_app/home/category/tab_item.dart';

import '../../model/SourceResponse.dart';


class Tabs extends StatefulWidget{
  List <Source> sourcesList;

 Tabs({required this.sourcesList});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
             isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (index){
                selectedIndex = index ;
               setState((){});
              },
              tabs: widget.sourcesList.map((source) => TabItem(source: source, isSelected:
             selectedIndex == widget.sourcesList.indexOf(source))).toList()
            ),
            NewsContainer(source: widget.sourcesList[selectedIndex])
          ],
        ));
  }
}