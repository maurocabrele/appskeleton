import 'package:json_annotation/json_annotation.dart';

part 'signup_success_entity.g.dart';

@JsonSerializable()
class SignUpSuccess{
  final String insertedId;
  final bool acknowledged;
  SignUpSuccess(this.acknowledged,this.insertedId);

  factory SignUpSuccess.fromJson(Map<String, dynamic> json) =>
      _$SignUpSuccessFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpSuccessToJson(this);
}