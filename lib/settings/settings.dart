
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/settings/bottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.lan, style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30),
            ),
            child: InkWell(
              onTap: () {
               showBottomSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.english, style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold,
                      fontSize: 18),),
                  Icon(Icons.arrow_drop_down_outlined, color: Colors.black,
                    size: 30,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  void showBottomSheet (BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (context) => BottomSheetScreen());
  }
}