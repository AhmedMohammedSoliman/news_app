import 'package:flutter/material.dart';
import 'package:news_app/home/category/categoryDetails.dart';
import 'package:news_app/home/category/category_screen.dart';
import 'package:news_app/settings/settings.dart';

import '../model/NewsResponse.dart';
import '../model/api_funs.dart';
import 'category/categoryItem.dart';
import 'category/newsItem.dart';
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
       actions: [
         IconButton(onPressed: (){
           showSearch(context: context, delegate: Search() );
         }, icon: Icon(Icons.search , size: 30,))
       ],
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

class Search extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
       showResults(context);
      }, icon: Icon(Icons.search , size: 25,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.pop(context);
    }, icon: Icon(Icons.clear , size: 25,));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(query: query),
        builder: (context , snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }else if (snapshot.hasError){
            return Column(
              children: [
                Text("SomeThing went wrong") ,
                ElevatedButton(
                    onPressed: (){
                      ApiManager.getNews(query: query);
                    }, child: Text("Try again"))
              ],
            );
          }
          if (snapshot.data?.status == "ok"){
            var newsList = snapshot.data?.articles ?? [] ;
            return Expanded(
              child: ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context , index){
                    return  NewsItem(news: newsList[index]) ;
                  }),
            );
          } return Text(snapshot.data?.message ?? "") ;
        }) ;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text("Suggestions"),);
  }

}