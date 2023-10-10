// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_placeholder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonPlaceholder _$JsonPlaceholderFromJson(Map<String, dynamic> json) =>
    JsonPlaceholder(
      json['title'] as String?,
      json['userId'] as int?,
      json['id'] as int?,
      json['completed'] as bool?,
    );

Map<String, dynamic> _$JsonPlaceholderToJson(JsonPlaceholder instance) =>
    <String, dynamic>{
      'title': instance.title,
      'userId': instance.userId,
      'id': instance.id,
      'completed': instance.completed,
    };
