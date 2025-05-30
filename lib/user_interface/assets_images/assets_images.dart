import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Container(color: Colors.white, child: Material(child: Assets())),
      ),
    ),
  );
}

/// Loading Images
class Assets extends StatelessWidget {
  const Assets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final data = await rootBundle.loadString('assets/json/config.json');
            final json = jsonDecode(data);
            print(json);
          },
          child: const Text('Load Json File'),
        ),
        Image.asset('assets/images/ic_elephant.webp'),
      ],
    );
  }
}
