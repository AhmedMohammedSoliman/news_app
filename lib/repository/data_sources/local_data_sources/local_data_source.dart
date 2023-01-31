import '../../../model/NewsResponse.dart';
import '../../../model/SourceResponse.dart';

abstract class LocalDataSource{
  Future<SourceResponse?> getSources (String categoryId);
  saveSourcesInFireBase(SourceResponse response , String categoryId);
  Future<NewsResponse?> getNews ({String? sourceId, int page = 1 , String? query});
  saveNewsInFireBase(NewsResponse response , String sourceId);
}