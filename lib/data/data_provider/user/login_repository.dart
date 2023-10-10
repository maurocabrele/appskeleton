import 'dart:async';

import 'package:dartz/dartz.dart';


abstract class LogInRepository {
  Future<Either<Map<String,dynamic>, String>> logIn({
    required String email,
    required String password,
  });

  Future<String> refreshToken();


}
