// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonComment _$JsonCommentFromJson(Map<String, dynamic> json) => JsonComment(
      json['name'] as String?,
      json['postId'] as int?,
      json['id'] as int?,
      json['body'] as String?,
    )..email = json['email'] as String?;

Map<String, dynamic> _$JsonCommentToJson(JsonComment instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
      'postId': instance.postId,
      'id': instance.id,
    };
