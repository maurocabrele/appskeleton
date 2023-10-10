
import 'package:appskeleton/data/data_provider/comment_list/comment_list_repository.dart';
import 'package:appskeleton/domain/entities/json_comment/json_comment.dart';
import 'package:appskeleton/presentation/pages/comment_page/comment_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentPageCubit extends Cubit<CommentPageState> {
  final CommentListRepository _commentListRepository;

  CommentPageCubit(this._commentListRepository) : super(CommentPageInitial());

  void getCommentList({required int postId}) async {
    final List<JsonComment> jsonComment =
    await _commentListRepository.getCommentList(postId: postId) ;
    emit(CommentPageLoaded(jsonComment));
  }
}