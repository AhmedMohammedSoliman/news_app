import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/data_sources/remote_data_sources/remote_data_sources_impl.dart';
import 'package:news_app/repository/main_repository.dart';
import 'package:news_app/repository/main_repository_impl.dart';
import '../../repository/data_sources/local_data_sources/loca_data_sources_impl.dart';
import 'categoryItem.dart';

class CategoryDetailsViewModel {
  late CategoryItem categoryItem ;
  MainRepository mainRepository = MainRepositoryImpl(RemoteDataSourcesImpl(), LocalDataSourceImpl());

  Future<SourceResponse?>getSources (){
   return mainRepository.getSources(categoryItem.id);
  }
}