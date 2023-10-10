import 'dart:async';
import 'dart:convert';

import 'package:appskeleton/data/data_provider/user/login_repository.dart';
import 'package:appskeleton/data/repositories/local_storage/local_storage_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LogInRepositoryImpl implements LogInRepository {
  final Dio _dio;

  LogInRepositoryImpl(this._dio);

  @override
  Future<Either<Map<String, dynamic>, String>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post('/login',
          data: json.encode({"email": email, "password": password}));
      print('SUCCESS logIn: ${response.data.toString()}');

      return Right(response.data.toString());
    } on DioException catch (e) {
      final err = e.response!.data!;
      print('ERROR logIn: ${err}');
      return Left(err);
    }
  }

  @override
  Future<String> refreshToken() async {
    final _expToken = await LocalStorageEncryptedImpl().read('jwt');
    return await _dio
        .post('/refreshtoken', data: json.encode({"expToken": _expToken}))
        .then((newToken) => newToken.data)
        .catchError((onError) => print('error ${onError}'));
  }
}
