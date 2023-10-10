import 'package:json_annotation/json_annotation.dart';

part 'signup_error_entity.g.dart';

@JsonSerializable()
class SignupError {
  final int index, code;
 // final Map<String, int> keyPattern;
 // final Map<String, String> keyValue;

  SignupError(this.index, this.code);

  factory SignupError.fromJson(Map<String, dynamic> json) =>
      _$SignupErrorFromJson(json);

  Map<String, dynamic> toJson() => _$SignupErrorToJson(this);
}
