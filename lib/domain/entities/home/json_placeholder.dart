import 'package:json_annotation/json_annotation.dart';
part 'json_placeholder.g.dart';

@JsonSerializable()
class JsonPlaceholder {
  String? title;
  int? userId, id;
  bool? completed;

  JsonPlaceholder(this.title, this.userId, this.id, this.completed);
  factory JsonPlaceholder.fromJson(Map<String, dynamic> json) =>
      _$JsonPlaceholderFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$JsonPlaceholderToJson(this);
}
