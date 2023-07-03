import 'package:appskeleton/data/datasources/remoteDataSources/constants/remote_const.dart';
import 'package:appskeleton/domain/entities/home/json_placeholder.dart';
import 'package:dio/dio.dart';

abstract class RemoteDataSources {
  Future<List<JsonPlaceholder>> getHomePageList();
}

class RemoteDataSourcesImpl implements RemoteDataSources {
  final Dio _dio;

  RemoteDataSourcesImpl(this._dio);

  ///HOMEPAGE
  @override
  Future<List<JsonPlaceholder>> getHomePageList() async {
    final List<JsonPlaceholder> _list = <JsonPlaceholder>[];
    await _dio.get(url).then((value) {
      for (var item in value.data) {
        _list.add(JsonPlaceholder.fromJson(item));
      }
    });
    return _list;
  }
}
