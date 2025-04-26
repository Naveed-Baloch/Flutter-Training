import 'package:flutter/material.dart';
import 'package:flutter_training/fundamentals/networking/ui/posts_screen_state.dart';
import 'package:flutter_training/fundamentals/networking/ui/view_modal.dart';

class PostsScreen extends StatelessWidget {
  final PostViewModal postViewModal = PostViewModal();

  PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: PostScreenState(
        screenVM: postViewModal,
        child: ListenableBuilder(
          listenable: postViewModal,
          builder: (context, child) {
            return Stack(
              children: [ Loading(), Error(), PostsList() ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postViewModal.getPosts();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = PostScreenState.of(context).screenVM.isLoading;
    return isLoading
            ? const Center(child: CircularProgressIndicator())
            : const SizedBox.shrink();
  }
}

class Error extends StatelessWidget {
  const Error({super.key});

  @override
  Widget build(BuildContext context) {
    final error = PostScreenState.of(context).screenVM.error;
    return error.isNotEmpty
        ? Center(child: Text(error))
        : const SizedBox.shrink();
  }
}

class PostsList extends StatelessWidget {
  const PostsList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenVM = PostScreenState.of(context).screenVM;
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: screenVM.posts.length,
      itemBuilder: (context, index) {
        final post = screenVM.posts[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(post.body, style: const TextStyle(fontSize: 14.0)),
              ],
            ),
          ),
        );
      },
    );
  }
}
