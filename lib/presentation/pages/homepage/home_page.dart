import 'package:appskeleton/presentation/pages/homepage/home_page_cubit.dart';
import 'package:appskeleton/presentation/pages/homepage/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (context) =>
          GetIt.instance.get<HomePageCubit>()..getHomePageList(),
      child: Builder(
          builder: (context) => Scaffold(
                appBar:
                    AppBar(title: const Text('HOMEPAGE'), centerTitle: true),
                body: BlocConsumer<HomePageCubit, HomePageState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    dynamic _state =
                        const Center(child: CircularProgressIndicator());
                    if (state is HomePageLoaded) {
                      _state = ListView.builder(
                          itemCount: state.jsonPlaceholder.length,
                          itemBuilder: (context, i) => Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  dense: true,
                                  tileColor: Colors.blue[100],
                                  trailing: state.jsonPlaceholder[i].completed!
                                      ? const Icon(Icons.done)
                                      : const Icon(Icons.undo),
                                  title: Text(state.jsonPlaceholder[i].title!),
                                  subtitle: Text(
                                      state.jsonPlaceholder[i].id!.toString()),
                                ),
                              ));
                    }
                    return _state;
                  },
                ),
              )),
    );
  }
}
