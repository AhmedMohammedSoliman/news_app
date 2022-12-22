import 'package:flutter/material.dart';
import 'package:news_app/home/category/singleNewsDetails.dart';
import 'package:news_app/provider/appProvider.dart';
import 'package:news_app/theming.dart';
import 'package:provider/provider.dart';

import 'home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context)=> MyProvider(),

      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        SingleNewsDetails.routeName : (context) => SingleNewsDetails(),
      },
      theme: MyTheme.lightTheme,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

    );
  }
}

