import 'package:news_app/fireBase/fireBase_fun.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/data_sources/local_data_sources/local_data_source.dart';

class LocalDataSourceImpl implements LocalDataSource{
  @override
  Future<SourceResponse?> getSources(String categoryId) {
    return FireBaseFun.getSourcesFromFireBase(categoryId);
  }

  @override
  saveSourcesInFireBase(SourceResponse response, String categoryId) {
    return FireBaseFun.addSourceToFireBase(response, categoryId);
  }

  @override
  Future<NewsResponse?> getNews({String? sourceId, int page = 1, String? query}) {
    return FireBaseFun.getNewsFromFireBase(sourceId!);
  }

  @override
  saveNewsInFireBase(NewsResponse response, String sourceId) {
    return FireBaseFun.addNewsToFireBase(response, sourceId);
  }

}