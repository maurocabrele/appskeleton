import 'package:appskeleton/domain/entities/json_comment/json_comment.dart';

abstract class CommentListRepository {
  Future<List<JsonComment>> getCommentList({required int postId});
}