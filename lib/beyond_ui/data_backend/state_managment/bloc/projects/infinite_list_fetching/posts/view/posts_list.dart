import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/beyond_ui/data_backend/state_managment/bloc/projects/infinite_list_fetching/posts/view/post_list_item.dart';

import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import '../bloc/post_state.dart';
import '../widgets/bottom_loader.dart';

class InfinitePostsList extends StatefulWidget {
  const InfinitePostsList({super.key});

  @override
  State<InfinitePostsList> createState() => _InfinitePostsListState();
}

class _InfinitePostsListState extends State<InfinitePostsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case PostStatus.success:
            if (state.posts.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.posts.length
                    ? const BottomLoader()
                    : PostListItem(post: state.posts[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.posts.length
                  : state.posts.length + 1,
              controller: _scrollController,
            );
          case PostStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}