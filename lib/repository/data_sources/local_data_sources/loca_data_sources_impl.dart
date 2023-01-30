import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/data_sources/local_data_sources/local_data_source.dart';

class LocalDataSourceImpl implements LocalDataSource{
  @override
  Future<SourceResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }

  @override
  saveSourcesInFireBase(SourceResponse response, String categoryId) {
    // TODO: implement saveSourcesInFireBase
    throw UnimplementedError();
  }

  @override
  Future<NewsResponse> getNews({String? sourceId, int page = 1, String? query}) {
    // TODO: implement getNews
    throw UnimplementedError();
  }

  @override
  saveNewsInFireBase(NewsResponse response, String sourceId) {
    // TODO: implement saveNewsInFireBase
    throw UnimplementedError();
  }

}