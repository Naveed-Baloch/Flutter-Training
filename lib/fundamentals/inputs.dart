import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 1. Buttons
/// 2. Texts
/// 3. TextField
/// 4. Form
/// 5. Segmented Buttons
/// 6. Chip
void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Container(color: Colors.white, child: Material(child: ChipsExample())),
      ),
    ),
  );
}

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  void _onPressed() {
    if (kDebugMode) {
      print('Button Pressed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: _onPressed, child: Text('1. Text Button')),
        FilledButton(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.red;
              }
              return Colors.blue;
            }),
            backgroundColor: WidgetStateProperty.all(Colors.blue),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
          onPressed: _onPressed,
          child: Text("2. Filled Button"),
        ),
        FloatingActionButton(onPressed: _onPressed, child: Text("3. Fab")),
        FilledButton.tonal(onPressed: _onPressed, child: Text("4. New")),
        ElevatedButton(
          onPressed: _onPressed,
          child: Text('5. Elevated Button'),
        ),
        OutlinedButton(
          onPressed: _onPressed,
          child: Text('6. Outlined Button'),
        ),
        ElevatedButton.icon(
          onPressed: _onPressed,
          label: Text("Icon Button"),
          style: ButtonStyle(
            iconAlignment: IconAlignment.end,
            backgroundColor: WidgetStateProperty.all(Colors.green),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          ),
          icon: Icon(Icons.ac_unit, color: Colors.pink),
        ),
      ],
    );
  }
}

class Texts extends StatelessWidget {
  const Texts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '1. Text',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SelectableText(
          '2. Selectable Text',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text.rich(
          TextSpan(
            text: '3. Rich Text ',
            style: TextStyle(
              color: Colors.green,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Please Visit',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              TextSpan(
                text: 'http://google.com',
                style: TextStyle(color: Colors.blueAccent, fontSize: 12),
              ),

              TextSpan(
                text: 'to learn More',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
        ),
        TextFieldExample(),
      ],
    );
  }
}

class TextFieldExample extends StatelessWidget {
  TextFieldExample({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '4. Text Field',
          ),
          onChanged: (value) {
            if (kDebugMode) {
              print(value);
            }
          },
          onSubmitted: (value) {},
        ),
      ),
    );
  }
}

class FormExample extends StatefulWidget {
  FormExample({super.key});

  @override
  State<FormExample> createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _formKey = GlobalKey<FormState>();
  final _firstFieldFocus = FocusNode();
  final _secondFieldFocus = FocusNode();

  @override
  void dispose() {
    _firstFieldFocus.dispose();
    _secondFieldFocus.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  focusNode: _firstFieldFocus,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '5. Form Field',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_secondFieldFocus);
                  },
                ),
                SizedBox(height: 16),

                TextFormField(
                  focusNode: _secondFieldFocus,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '6. Form Field',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    _secondFieldFocus.unfocus();
                    _onSubmit();
                  },
                ),
                SizedBox(height: 20),

                ElevatedButton(onPressed: _onSubmit, child: Text('Submit')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 5. Segmented Buttons allows to select from range of 2-5 buttons
enum Gender { male, female, other }

class SegmentedButtonExample extends StatefulWidget {
  const SegmentedButtonExample({super.key});

  @override
  State<SegmentedButtonExample> createState() => _SegmentedButtonExampleState();
}

class _SegmentedButtonExampleState extends State<SegmentedButtonExample> {
  var gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SegmentedButton(
            segments: <ButtonSegment<Gender>>[
              ButtonSegment<Gender>(value: Gender.male, label: Text('Male')),
              ButtonSegment<Gender>(value: Gender.female, label: Text('Female')),
              ButtonSegment<Gender>(value: Gender.other, label: Text('Other')),
            ],
            selected: <Gender>{gender},
            onSelectionChanged: (Set<Gender> newSelection) {
              setState(() {
                gender = newSelection.first;
              });
            },
          ),
        ],
      ),
    );
  }
}

///6. Chips
class ChipsExample extends StatelessWidget {
  const ChipsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 8,
        runSpacing: 4,
        children: [
          Chip(
            avatar: CircleAvatar(
                backgroundImage: AssetImage('assets/images/dash_chef.png')),
            label: Text('Chef Dash'),
          ),
          Chip(
            avatar: CircleAvatar(
                backgroundImage:
                AssetImage('assets/images/dash_firefighter.png')),
            label: Text('Firefighter Dash'),
          ),
          Chip(
            avatar: CircleAvatar(
                backgroundImage: AssetImage('assets/images/dash_musician.png')),
            label: Text('Musician Dash'),
          ),
          Chip(
            avatar: CircleAvatar(
                backgroundImage: AssetImage('assets/images/dash_artist.png')),
            label: Text('Artist Dash'),
          ),
        ],

      ),
    );
  }
}


