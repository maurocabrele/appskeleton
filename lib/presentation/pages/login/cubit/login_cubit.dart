import 'package:appskeleton/data/data_provider/local_storage/local_storage_repository.dart';
import 'package:appskeleton/data/data_provider/user/login_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final LogInRepository service;
  final LocalStorageEncrypted store;

  LogInCubit({required this.service, required this.store})
      : super(const LogInInitial(email: '', password: ''));

  void emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  Future login() async {
    final response =
        await service.logIn(email: state.email, password: state.password);
    return response.fold((l) => l, (r) {
      store.write('jwt', r);
      return r;
    });
  }
}
