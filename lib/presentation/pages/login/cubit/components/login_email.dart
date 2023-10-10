import 'package:appskeleton/presentation/pages/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailInputLogin extends StatelessWidget {
  const EmailInputLogin({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<LogInCubit, LogInState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          decoration: const InputDecoration(hintText: 'E- mail'),
          key: const Key('emailInputLogin_textField'),
          keyboardType: TextInputType.emailAddress,
          onChanged: (email) => context.read<LogInCubit>().emailChanged(email),
        );
      },
    );
}
