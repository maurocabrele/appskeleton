import 'dart:convert';

import 'package:appskeleton/core/failures/dio/signup_error_entity.dart';
import 'package:appskeleton/core/success/signup_success_entity.dart';
import 'package:appskeleton/data/data_provider/user/signup_repository.dart';
import 'package:appskeleton/domain/entities/user/signup/signup_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  final Dio _dio;

  SignUpRepositoryImpl(this._dio);

  @override
  Future<Either<SignupError, SignUpSuccess>> signUp(
      {required SignUpEntity signup}) async {
    try {
      final response = await _dio.post('/signup', data: json.encode(signup));
      return Right(SignUpSuccess.fromJson(response.data));
    } on DioException catch (e) {
      final err = SignupError.fromJson(e.response!.data!);
      return Left(err);
    }
  }
}
