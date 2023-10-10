import 'package:json_annotation/json_annotation.dart';
part 'json_comment.g.dart';

@JsonSerializable()
class JsonComment {
  String? name,email,body;
  int? postId, id;


  JsonComment(this.name, this.postId, this.id, this.body);
  factory JsonComment.fromJson(Map<String, dynamic> json) =>
      _$JsonCommentFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$JsonCommentToJson(this);
}