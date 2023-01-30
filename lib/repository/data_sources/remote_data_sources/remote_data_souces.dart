
import '../../../model/NewsResponse.dart';
import '../../../model/SourceResponse.dart';

abstract class RemoteDataSource{
  Future<SourceResponse> getSources (String categoryId);
  Future<NewsResponse> getNews ({String? sourceId, int page = 1 ,String? query});
}