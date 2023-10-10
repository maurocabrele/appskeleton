// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      dob: json['dob'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      jwt: json['jwt'] as String,
      refreshjwt: json['refreshjwt'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dob': instance.dob,
      'email': instance.email,
      'password': instance.password,
      'jwt': instance.jwt,
      'refreshjwt': instance.refreshjwt,
    };
