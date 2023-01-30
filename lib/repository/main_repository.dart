import '../model/NewsResponse.dart';
import '../model/SourceResponse.dart';

abstract class MainRepository {
  Future<SourceResponse> getSources (String categoryId);
  Future<NewsResponse> getNews ();
}