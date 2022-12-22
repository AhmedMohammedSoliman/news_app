import 'package:flutter/material.dart';

import '../theming.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget{
  static const int category = 0 ;
  static const int settings= 1 ;
  Function onDrawerItemClick ;
  HomeDrawer({required this.onDrawerItemClick});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 200,
            color: MyTheme.primaryColor,
            child: Text(AppLocalizations.of(context)!.newsDrawer, style:  Theme.of(context).textTheme.headline2),
          ) ,
          InkWell(
            onTap: (){
                 onDrawerItemClick(HomeDrawer.category);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
              child: Row(
                children: [
                  Icon(Icons.list_sharp , size: 30,) ,
                  SizedBox(width: 10,),
                  Text(AppLocalizations.of(context)!.category, style: Theme.of(context).textTheme.subtitle1,)
                ],
              ),
            ),
          ) ,
          InkWell(
            onTap: (){
              onDrawerItemClick(HomeDrawer.settings);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
              child: Row(
                children: [
                  Icon(Icons.settings , size: 30,) ,
                  SizedBox(width: 10,),
                  Text(AppLocalizations.of(context)!.settings, style: Theme.of(context).textTheme.subtitle1,)
                ],
              ),
            ),
          ) ,

        ],
      ),
    );
  }
}