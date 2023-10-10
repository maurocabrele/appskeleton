//part of 'authentication_cubit.dart';

import 'package:appskeleton/enum/authentication/authentication_status.dart';
import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;

  const AuthenticationState(this.status);

  @override
  List<Object> get props => [status];

  AuthenticationState copyWith(AuthenticationStatus status) =>
      AuthenticationState(status);

  AuthenticationStatus get state => status;
}
