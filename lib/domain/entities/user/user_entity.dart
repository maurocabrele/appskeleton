import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class User {
  final String firstName, lastName, dob, email, password, jwt, refreshjwt;

  const User(
      {required this.firstName,
      required this.lastName,
      required this.dob,
      required this.email,
      required this.password,
      required this.jwt,
      required this.refreshjwt});

  static const empty = User(
      firstName: '',
      lastName: '',
      dob: '',
      email: '',
      jwt: '',
      password: '',
      refreshjwt: '');

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
