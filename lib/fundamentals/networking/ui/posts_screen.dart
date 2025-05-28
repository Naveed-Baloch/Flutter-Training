import 'package:flutter/material.dart';
import 'package:flutter_training/fundamentals/networking/ui/posts_screen_state.dart';
import 'package:flutter_training/fundamentals/networking/ui/view_modal.dart';

import '../theme/theme_manager.dart';

class PostsScreen extends StatelessWidget {
  final ThemeManager themeManager;
  final PostViewModal postViewModal = PostViewModal();

  PostsScreen({super.key, required this.themeManager});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Theme(
          data: theme.copyWith(
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
            textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.red),
          )),
          child: Builder(
            builder:
                (context) => Text(
                  'Posts',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
          ),
        ),
        toolbarTextStyle: theme.appBarTheme.titleTextStyle?.copyWith(
          fontStyle: FontStyle.italic,
        ),
        actions: [
          PopupMenuButton<ThemeMode>(
            icon: Icon(_getThemeModeIcon()),
            tooltip: 'Toggle Theme',
            onSelected: (ThemeMode mode) {
              themeManager.setThemeMode(mode);
            },
            itemBuilder:
                (context) => [
                  PopupMenuItem(
                    value: ThemeMode.light,
                    child: Row(
                      children: [
                        Icon(
                          Icons.light_mode,
                          color:
                              themeManager.themeMode == ThemeMode.light
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                        ),
                        const SizedBox(width: 8),
                        const Text('Light'),
                        if (themeManager.themeMode == ThemeMode.light)
                          Icon(
                            Icons.check,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: ThemeMode.dark,
                    child: Row(
                      children: [
                        Icon(
                          Icons.dark_mode,
                          color:
                              themeManager.themeMode == ThemeMode.dark
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                        ),
                        const SizedBox(width: 8),
                        const Text('Dark'),
                        if (themeManager.themeMode == ThemeMode.dark)
                          Icon(
                            Icons.check,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: ThemeMode.system,
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings_brightness,
                          color:
                              themeManager.themeMode == ThemeMode.system
                                  ? Theme.of(context).colorScheme.primary
                                  : null,
                        ),
                        const SizedBox(width: 8),
                        const Text('System'),
                        if (themeManager.themeMode == ThemeMode.system)
                          Icon(
                            Icons.check,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      ],
                    ),
                  ),
                ],
          ),
        ],
      ),
      body: PostScreenState(
        screenVM: postViewModal,
        child: ListenableBuilder(
          listenable: postViewModal,
          builder: (context, child) {
            return Stack(children: [Loading(), Error(), PostsList()]);
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

  IconData _getThemeModeIcon() {
    switch (themeManager.themeMode) {
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.system:
        return Icons.settings_brightness;
    }
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
