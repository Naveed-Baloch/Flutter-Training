import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'name_generator.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<NameGeneratorState>();
    var favorites = appState.favorites;

    return favorites.isEmpty
        ? const Center(child: Text('No favorites yet.'))
        : ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'You have '
                '${favorites.length} favorites:',
              ),
            ),
            for (var pair in favorites)
              ListTile(
                leading: const Icon(CupertinoIcons.heart),
                title: Text(pair.asLowerCase),
              ),
          ],
        );
  }
}
