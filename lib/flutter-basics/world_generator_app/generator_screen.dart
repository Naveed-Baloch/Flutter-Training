import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'word_card.dart';
import 'name_generator.dart';

class GeneratorScreen extends StatelessWidget {
  const GeneratorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<NameGeneratorState>();
    var pair = appState.current;
    var isFavorite = appState.favorites.contains(pair);
    var icon = isFavorite ? Icons.favorite : Icons.favorite_border;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                icon: Icon(icon),
                onPressed: appState.toggleFavorite,
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: appState.getNext,
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
