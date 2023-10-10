import 'package:json_annotation/json_annotation.dart';

part 'signup_entity.g.dart';

@JsonSerializable()
class SignUpEntity {
    String firstName, lastName, dob, email, password;

    SignUpEntity(
      {required this.email,
      required this.password,
      required this.dob,
      required this.lastName,
      required this.firstName});


  factory SignUpEntity.fromJson(Map<String, dynamic> json) =>
      _$SignUpEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpEntityToJson(this);
}
