import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/data_sources/remote_data_sources/remote_data_souces.dart';

import '../../../model/api_funs.dart';

class RemoteDataSourcesImpl implements RemoteDataSource{
  @override
  Future<SourceResponse> getSources(String categoryId) {
    return ApiManager.getSources(categoryId);
  }

  @override
  Future<NewsResponse> getNews({String? sourceId, int page = 1, String? query}) {
    return ApiManager.getNews();
  }

}