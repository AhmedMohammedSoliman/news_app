import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier{

  String appLanguage = "en";

  void changeLanguage (String newLanguge) {
    if (appLanguage == newLanguge){
      return ;
    }else {
      appLanguage = newLanguge ;
    }
    notifyListeners();
  }
}