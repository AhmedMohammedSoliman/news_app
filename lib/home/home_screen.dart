import 'package:flutter/material.dart';
import 'package:news_app/home/category/categoryDetails.dart';
import 'package:news_app/home/category/category_screen.dart';
import 'package:news_app/settings/settings.dart';

import 'category/categoryItem.dart';
import 'drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget{

  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),
         bottomLeft: Radius.circular(30) ,)
       ),
       title: Text(AppLocalizations.of(context)!.newsAppBar  , style: Theme.of(context).textTheme.headline1,),
       centerTitle: true,
     ),
      drawer: Drawer(
         child: HomeDrawer(onDrawerItemClick: onDrawerClick)
      ),
      body: selectedItemDrawer == HomeDrawer.settings ?
          SettingScreen() :
      selectedCategory == null ?
      CategoryScreen(onItemClick: onItemClickAction ) : CategoryDetails(categoryitem: selectedCategory!),
    );
  }

  CategoryItem? selectedCategory = null ;

  void onItemClickAction (CategoryItem categoryItem){
    selectedCategory = categoryItem ;
    setState((){});
  }

  int selectedItemDrawer = HomeDrawer.category;
  void onDrawerClick (int selectedIndex){
    selectedItemDrawer = selectedIndex;
    selectedCategory = null ;
    Navigator.pop(context);
    setState((){});
  }
}