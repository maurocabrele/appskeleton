import 'package:appskeleton/presentation/pages/comment_page/comment_page_cubit.dart';
import 'package:appskeleton/presentation/pages/comment_page/comment_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CommentPage extends StatelessWidget {
  static const routeName = '/comment';
  final int postId;

  const CommentPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommentPageCubit>(
        create: (context) => GetIt.instance.get<CommentPageCubit>()
          ..getCommentList(postId: postId),
        child: Builder(
            builder: (context) => Scaffold(
                appBar: AppBar(title: const Text('COMMENT'), centerTitle: true),
                body: BlocConsumer<CommentPageCubit, CommentPageState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      dynamic _state =
                          const Center(child: CircularProgressIndicator());
                      if (state is CommentPageLoaded) {
                        _state = ListView.builder(
                            itemCount: state.jsonComment.length,
                            itemBuilder: (context, i) => Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                    dense: true,
                                    tileColor: Colors.blue[100],
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add)),
                                    title: Text(
                                        'TITLE: ${state.jsonComment[i].name!}'
                                            .toUpperCase()),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                'COMMENT ID: ${state.jsonComment[i].id!}'),
                                            Text(
                                                'POST ID: ${state.jsonComment[i].postId!}')
                                          ],
                                        ),
                                        Text(
                                            'COMMENT EMAIL: ${state.jsonComment[i].email!}')
                                      ],
                                    ))));
                      }
                      return _state;
                    }))));
  }
}
