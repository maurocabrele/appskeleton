part of 'login_cubit.dart';

  class LogInState extends Equatable {
  final String email, password;
  const LogInState({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];

  LogInState copyWith({email, password}) => LogInState(
        email: email ?? this.email,
        password: password ?? this.password,
      );
}

final class LogInInitial extends LogInState {
  const LogInInitial({required super.email, required super.password});
}
