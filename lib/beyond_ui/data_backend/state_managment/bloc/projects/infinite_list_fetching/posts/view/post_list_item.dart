import 'package:flutter/material.dart';
import '../../../../../../../../fundamentals/networking/network/domain/post.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Text('${post.id}', style: textTheme.bodySmall),
      title: Text(post.title),
      isThreeLine: true,
      subtitle: Text(post.body),
      dense: true,
    );
  }
}