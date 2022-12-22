import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleNewsDetails extends StatelessWidget{

  static const String routeName= "news_details";

  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context)?.settings.arguments as Map ;

   return SafeArea(
     child: Scaffold(
       body: Container(
         padding: EdgeInsets.all(10),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Container(
               clipBehavior: Clip.antiAlias,
               child: Image(image: NetworkImage(args["image"])),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(20)) ,
               ),
             ),
             SizedBox(height: 10,) ,
             Text("${args["author"]}", style: TextStyle(fontSize: 18),) ,
             SizedBox(height: 10,) ,
             Text("${args["title"]}", style: TextStyle(fontWeight: FontWeight.bold ,
                 fontSize: 20), ),
             SizedBox(height: 10,) ,
             Text("${args["date"]}", textAlign: TextAlign.end,),
             SizedBox(height: 10,) ,
             Text("${args["content"]}", style: TextStyle(fontSize: 18),),
             SizedBox(height: 30,),
             InkWell(
               onTap: ()async{
                 var url = Uri.parse(args["url"] ?? '');
                 if (await canLaunchUrl(url)) {
                   await launchUrl(url);
                 } else {
                   throw 'Could not launch $url';
                 }
               },
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Text("View Full Article" , style: TextStyle(fontWeight: FontWeight.bold ,
                       fontSize: 20) ,),
                   Icon(Icons.arrow_right , size: 30,)
                 ],
               ),
             )

           ],
         ),
       ),
     ),
   );
  }

}