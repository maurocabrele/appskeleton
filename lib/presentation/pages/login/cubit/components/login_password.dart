import 'package:appskeleton/presentation/pages/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordInputLogin extends StatelessWidget {
  const PasswordInputLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInCubit, LogInState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          decoration: const InputDecoration(hintText: 'Password'),
          key: const Key('passwordInputLogin_textField'),
          keyboardType: TextInputType.emailAddress,
          onChanged: (email) => context.read<LogInCubit>().passwordChanged(email),
        );
      },
    );
  }
}
