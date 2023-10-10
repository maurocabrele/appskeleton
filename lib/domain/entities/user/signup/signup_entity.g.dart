// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpEntity _$SignUpEntityFromJson(Map<String, dynamic> json) => SignUpEntity(
      email: json['email'] as String,
      password: json['password'] as String,
      dob: json['dob'] as String,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
    );

Map<String, dynamic> _$SignUpEntityToJson(SignUpEntity instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dob': instance.dob,
      'email': instance.email,
      'password': instance.password,
    };
