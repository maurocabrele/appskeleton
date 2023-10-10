

import 'package:appskeleton/domain/entities/json_placeholder/json_placeholder.dart';

abstract class TodoListRepository {
  Future<List<JsonPlaceholder>> getTodoList();
}


