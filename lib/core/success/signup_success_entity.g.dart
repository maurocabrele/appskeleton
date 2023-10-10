// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_success_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpSuccess _$SignUpSuccessFromJson(Map<String, dynamic> json) =>
    SignUpSuccess(
      json['acknowledged'] as bool,
      json['insertedId'] as String,
    );

Map<String, dynamic> _$SignUpSuccessToJson(SignUpSuccess instance) =>
    <String, dynamic>{
      'insertedId': instance.insertedId,
      'acknowledged': instance.acknowledged,
    };
