import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Keys are unique identifiers which helps flutter for identifying the Widgets
/// which are changed, or animated
/// Types of Keys
/// 1. -> ValueKey i.e ValueKey(1)
/// 2. -> UniqueKey is used when we want to reconstruct the widget every time other state changes
/// 3. -> Global Keys i.e Forms Keys

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: Material(child: FormKeyExample()),
          ),
        ),
      ),
    ),
  );
}

class ReorderableTextFieldList extends StatefulWidget {
  const ReorderableTextFieldList({super.key});

  @override
  _ReorderableTextFieldListState createState() =>
      _ReorderableTextFieldListState();
}

class _ReorderableTextFieldListState extends State<ReorderableTextFieldList> {
  List<String> items = ['One', 'Two', 'Three'];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) newIndex--;
          final item = items.removeAt(oldIndex);
          items.insert(newIndex, item);
        });
      },
      children: [
        for (int i = 0; i < items.length; i++)
          Text(items[i], key: ValueKey(items[i])),
      ],
    );
  }
}

class FormKeyExample extends StatelessWidget {
  FormKeyExample({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              final currentState = _formKey.currentState;
              if (currentState != null && currentState.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
