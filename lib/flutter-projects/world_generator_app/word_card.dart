import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

/// Intro to
/// Theme and styles
/// Implicit animation.
/// Improve Accessibility & Talkback -> Semantic Label
///
class BigCard extends StatelessWidget {
  final WordPair pair;

  const BigCard({super.key, required this.pair});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      elevation: 1,
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase.toUpperCase(),
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
