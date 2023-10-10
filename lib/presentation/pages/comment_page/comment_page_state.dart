import 'package:appskeleton/domain/entities/json_comment/json_comment.dart';
import 'package:equatable/equatable.dart';

abstract class CommentPageState extends Equatable {
  const CommentPageState();
}

class CommentPageInitial extends CommentPageState {
  @override
  List<Object> get props => [];
}

class CommentPageLoaded extends CommentPageState {
  final List<JsonComment> jsonComment;

  const CommentPageLoaded(this.jsonComment);

  @override
  List<Object> get props => [jsonComment];
}
