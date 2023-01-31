import 'package:news_app/repository/data_sources/local_data_sources/loca_data_sources_impl.dart';
import 'package:news_app/repository/data_sources/remote_data_sources/remote_data_sources_impl.dart';
import 'package:news_app/repository/main_repository.dart';
import 'package:news_app/repository/main_repository_impl.dart';
import '../../model/NewsResponse.dart';

class NewsWidgetViewModel {
  MainRepository mainRepository = MainRepositoryImpl(RemoteDataSourcesImpl(), LocalDataSourceImpl());
  Future<NewsResponse?>getNewsFun ({String? sourceId, int page = 1 , String? query}){
    return mainRepository.getNews();
  }
  }