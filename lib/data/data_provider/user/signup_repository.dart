import 'package:appskeleton/core/failures/dio/signup_error_entity.dart';
import 'package:appskeleton/core/success/signup_success_entity.dart';
import 'package:appskeleton/domain/entities/user/signup/signup_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignUpRepository {
  Future<Either<SignupError, SignUpSuccess>> signUp({required SignUpEntity signup});
}
