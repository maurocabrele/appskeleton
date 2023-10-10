import 'package:appskeleton/enum/authentication/authentication_status.dart';
import 'package:appskeleton/features/authentication/authentication_cubit.dart';
import 'package:appskeleton/features/authentication/authentication_state.dart';
import 'package:appskeleton/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(
        create: (context) => GetIt.instance.get<AuthenticationCubit>(),
        child:  Builder(
            builder: (context) =>  Scaffold(
              appBar:
              AppBar(title: const Text('HOMEPAGE'), centerTitle: true, actions: [
                ElevatedButton(
                    onPressed: () => goToLogIn(context),
                    child: const Text('Log in')),
                ElevatedButton(
                    onPressed: () => goToSignUp(context),
                    child: const Text('Sign up'))
              ]),
              body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listener: (context, state) {
                },

                builder: (context, state) => state.state == AuthenticationStatus.authenticated
                  ? const Center(child: Text('LOGGED IN'))
                  :   TextButton(onPressed: () { print('AuthenticationCubit ${context.read<AuthenticationCubit>().state.state}'); },
                  child: Text('Need to login'))))));


}
