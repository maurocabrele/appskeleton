import 'package:appskeleton/data/datasources/remoteDataSources/remoteDataSources.dart';
import 'package:appskeleton/domain/entities/home/json_placeholder.dart';
import 'package:appskeleton/domain/repositories/home_page_repository.dart';

class HomePageRepositoryImpl implements HomePageRepository {
  final RemoteDataSources _remoteDataSource;

  HomePageRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<JsonPlaceholder>> getHomePageList() async =>
      await _remoteDataSource.getHomePageList();
}
