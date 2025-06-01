import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Screen3Data {
  final String name;
  final String description;

  Screen3Data({required this.name, required this.description});
}

class Screen3 extends StatelessWidget {
  final Screen3Data data;

  const Screen3({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(data.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.pop(
                  Screen3Data(
                    name: '${data.name} Updated',
                    description: '${data.description} Updated',
                  ),
                );
              },
              child: const Text('Go back!'),
            ),
            Text(data.description),
          ],
        ),
      ),
    );
  }
}
