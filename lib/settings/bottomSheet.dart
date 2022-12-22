import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../provider/appProvider.dart';

class BottomSheetScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              provider.changeLanguage("en");
            },
            child: provider.appLanguage == "en" ? selectedShape(AppLocalizations.of(context)!.english, context):
            unSelectedShape(AppLocalizations.of(context)!.english, context),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: (){
              provider.changeLanguage("ar");
            },
            child: provider.appLanguage == "ar" ? selectedShape(AppLocalizations.of(context)!.arabic, context):
            unSelectedShape(AppLocalizations.of(context)!.arabic, context),
          ),
        ],
      ),
    );
  }
  Widget selectedShape (String text , BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text , style: TextStyle(color: Colors.red , fontSize: 20 , fontWeight: FontWeight
            .bold),),
        Icon(Icons.check , size: 30, color: Colors.red,),
      ],
    );
  }

  Widget unSelectedShape (String text , BuildContext context){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight
            .bold),),
      ],
    );
    }
}