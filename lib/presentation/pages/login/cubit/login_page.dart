import 'package:appskeleton/enum/authentication/authentication_status.dart';
import 'package:appskeleton/features/authentication/authentication_cubit.dart';
import 'package:appskeleton/features/authentication/authentication_state.dart';
import 'package:appskeleton/presentation/pages/login/cubit/components/login_email.dart';
import 'package:appskeleton/presentation/pages/login/cubit/components/login_password.dart';
import 'package:appskeleton/presentation/pages/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LogIn extends StatelessWidget {
  static const routeName = '/login';

  const LogIn({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetIt.instance.get<AuthenticationCubit>(),
          ),
          BlocProvider<LogInCubit>(
            create: (context) => GetIt.instance.get<LogInCubit>(),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('LOG IN'),
          ),
          body: BlocConsumer<LogInCubit, LogInState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) => ListView(
                    children: [
                      const EmailInputLogin(),
                      const PasswordInputLogin(),
                      const SizedBox(height: 50),
                      BlocConsumer<AuthenticationCubit, AuthenticationState>(
                        listener: (context, state) {},
                        builder: (context, state) => FloatingActionButton(
                          onPressed: () {
                            context.read<LogInCubit>().login();

                            context
                                .read<AuthenticationCubit>()
                                .setAuthenticated();
                          },
                          child: const Text('Log In'),
                        ),
                      ),
                      const SizedBox(height: 150),
                      context.read<AuthenticationCubit>().state.state ==
                              AuthenticationStatus.authenticated
                          ? const Center(child: Text('LOGGED IN'))
                          : const Center(child: Text('Need to login'))
                    ],
                  )),
        ),
      );
}
