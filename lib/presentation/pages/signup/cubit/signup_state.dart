part of 'signup_cubit.dart';

class SignUpState extends Equatable {
  final SignUpEntity signup;

 const SignUpState({required this.signup}) ;

  @override
  List<Object> get props => [signup];

  SignUpState copyWith({required SignUpEntity signUp}) => SignUpState(signup: signUp ?? signUp);
}

final class SignupInitial extends SignUpState {
  const SignupInitial({required super.signup});
}
