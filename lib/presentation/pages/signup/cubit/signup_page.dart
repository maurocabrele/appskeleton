import 'package:appskeleton/core/success/signup_success_entity.dart';
import 'package:appskeleton/enum/signup_fields/signup_fields.dart';
import 'package:appskeleton/presentation/components/flash_banner.dart';
import 'package:appskeleton/presentation/pages/signup/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SignUp extends StatelessWidget {
  static const routeName = '/signup';

  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => GetIt.instance.get<SignUpCubit>(),
      child: Builder(
          builder: (context) => Scaffold(
                appBar: AppBar(
                  title: const Text('SIGN UP'),
                ),
                body: BlocConsumer<SignUpCubit, SignUpState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return ListView(
                      //  mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...SignUpFields.values.map((field) => TextFormField(
                              decoration: InputDecoration(
                                  labelText: field.name.toUpperCase()),
                              onChanged: (userInput) {
                                if (field.name != 'confirmPassword') {
                                  context
                                      .read<SignUpCubit>()
                                      .setSignUpFields(field.name, userInput);
                                }
                              },
                            )),
                        const SizedBox(height: 50),
                        FloatingActionButton(
                          onPressed: () => context
                              .read<SignUpCubit>()
                              .signup()
                              .then((value) {
                            value.fold(
                              (l) {
                                AppFlash.showBanner(context,
                                    message: l.code.toString(),
                                    backgroundColor: Colors.cyan);
                              },
                              (r) {
                                AppFlash.showBanner(context,
                                    message:
                                        r.insertedId,
                                    backgroundColor: Colors.greenAccent);
                              },
                            );
                          }).catchError((onError) {
                            print('${onError}');
                          }),
                          child: const Text('Sign Up'),
                        ),
                      ],
                    );
                  },
                ),
              )),
    );
  }
}
