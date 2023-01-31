import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

class FireBaseFun {

  static CollectionReference<SourceResponse> getCollectionFromFireBase (){
   return FirebaseFirestore.instance.collection('sources').withConverter<SourceResponse>(
        fromFirestore: (snapshot, _) => SourceResponse.fromJson(snapshot.data()!),
        toFirestore: (source, _) => source.toJson()
    );
  }
   static Future<void> addSourceToFireBase (SourceResponse sourceResponse , String categoryId){
    return getCollectionFromFireBase().doc(categoryId).set(sourceResponse);
  }

  static Future<SourceResponse?> getSourcesFromFireBase (String categoryId) async{
   var documentSnapShot =  await getCollectionFromFireBase().doc(categoryId).get();
   return documentSnapShot.data();
  }

  static CollectionReference<NewsResponse> getNewsCollectionFromFireBase(){
   return FirebaseFirestore.instance.collection('news').withConverter<NewsResponse>(
        fromFirestore: (snapshot, _) => NewsResponse.fromJson(snapshot.data()!),
        toFirestore: (news, _) => news.toJson()
    );
  }

  static Future<void> addNewsToFireBase(NewsResponse response , String sourceId){
   return getNewsCollectionFromFireBase().doc(sourceId).set(response);
  }

  static Future<NewsResponse?> getNewsFromFireBase(String sourceId)async {
    var documentSnapShot = await getNewsCollectionFromFireBase().doc(sourceId).get();
    return documentSnapShot.data();
  }

}