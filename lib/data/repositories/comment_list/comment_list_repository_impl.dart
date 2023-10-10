import 'package:appskeleton/data/data_provider/comment_list/comment_list_repository.dart';
import 'package:appskeleton/domain/entities/json_comment/json_comment.dart';
import 'package:dio/dio.dart';

class CommentListRepositoryImpl implements CommentListRepository {
  final Dio _dio;

  CommentListRepositoryImpl(this._dio);

  @override
  Future<List<JsonComment>> getCommentList({required int postId}) async {
    final List<JsonComment> _comment_list = <JsonComment>[];
    await _dio.get('/comments?postId=$postId').then((value) {
      for (var item in value.data) {
        _comment_list.add(JsonComment.fromJson(item));
      }
    });
    return _comment_list;
  }
}
