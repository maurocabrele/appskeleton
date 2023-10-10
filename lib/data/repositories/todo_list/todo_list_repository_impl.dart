import 'package:appskeleton/data/data_provider/todo_list/todo_list_repository.dart';
import 'package:appskeleton/domain/entities/json_placeholder/json_placeholder.dart';
import 'package:dio/dio.dart';

class TodoListRepositoryImpl implements TodoListRepository {
  final Dio _dio;

  TodoListRepositoryImpl(this._dio);

  @override
  Future<List<JsonPlaceholder>> getTodoList() async {
    final List<JsonPlaceholder> _list = <JsonPlaceholder>[];
    await _dio.get('/todos').then((value) {
      for (var item in value.data) {
        _list.add(JsonPlaceholder.fromJson(item));
      }
    });
    return _list;
  }
}