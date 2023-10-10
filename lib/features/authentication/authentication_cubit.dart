import 'package:appskeleton/enum/authentication/authentication_status.dart';
import 'package:appskeleton/features/authentication/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit()
      : super(const AuthenticationState(AuthenticationStatus.unauthenticated));

  /// Setters
  void setAuthenticated() => emit(state.copyWith(AuthenticationStatus.authenticated));
  void setUnauthenticated() => emit(state.copyWith(AuthenticationStatus.unauthenticated));

}
