import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/beyond_ui/data_backend/state_managment/bloc/projects/infinite_list_fetching/posts/view/posts_list.dart';
import 'package:http/http.dart' as http;
import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => PostBloc(httpClient: http.Client())..add(PostFetched()),
        child: const InfinitePostsList(),
      ),
    );
  }
}