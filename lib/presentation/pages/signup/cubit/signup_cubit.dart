import 'package:appskeleton/core/failures/dio/signup_error_entity.dart';
import 'package:appskeleton/core/success/signup_success_entity.dart';
import 'package:appskeleton/data/data_provider/user/signup_repository.dart';
import 'package:appskeleton/domain/entities/user/signup/signup_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepository signUp;

  SignUpCubit({required this.signUp})
      : super(SignupInitial(
            signup: SignUpEntity(
                firstName: '',
                lastName: '',
                dob: '',
                email: '',
                password: '')));

  void setSignUpFields(String field, String value) {
    final _signup = state.signup.toJson();
    _signup[field] = value;
    emit(state.copyWith(signUp: SignUpEntity.fromJson(_signup)));
  }

  Future<Either<SignupError, SignUpSuccess>> signup() async =>
      signUp.signUp(signup: state.signup);
}
