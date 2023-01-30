import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/data_sources/remote_data_sources/remote_data_souces.dart';
import 'package:news_app/repository/main_repository.dart';
import 'data_sources/local_data_sources/local_data_source.dart';
import 'package:connectivity/connectivity.dart';

class MainRepositoryImpl implements MainRepository{

  RemoteDataSource remoteDataSource ;    /// object from abstract class
  LocalDataSource localDataSource ;      /// object from abstract class

  MainRepositoryImpl(this.remoteDataSource , this.localDataSource);

  @override
  Future<SourceResponse> getSources(String categoryId) async {
    /// data and cash
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile){
      var response = await remoteDataSource.getSources(categoryId);
      return response ;
    }else {
      return localDataSource.getSources(categoryId);
    }
  }

  @override
  Future<NewsResponse> getNews({String? sourceId, int page = 1, String? query}) async {
    /// data and cash
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile){
      var response = await remoteDataSource.getNews();
      return response ;
    }else {
      return localDataSource.getNews();
    }
  }

}