import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Learnings-> State Management using
/// 1. State-full widgets
/// 2. Sharing states b/w widgets using constructors, inherited widgets and callback
/// 3. Using Listenable
/// 4. Using Listenable with MVVM
/// 1. Using State full widgets

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Container(color: Colors.white, child: TodoScreen()),
      ),
    ),
  );
}

class CounterUsingStateFul extends StatefulWidget {
  const CounterUsingStateFul({super.key});

  @override
  State<CounterUsingStateFul> createState() => _CounterUsingStateFulState();
}

class _CounterUsingStateFulState extends State<CounterUsingStateFul> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text(_count.toString()),
            CupertinoButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: const Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}

/// 2. Sharing states b/w widgets using constructors, inherited widgets and callback
/// 1. USing Constructors
class ShareStateUsingConstructor extends StatefulWidget {
  const ShareStateUsingConstructor({super.key});

  @override
  State<ShareStateUsingConstructor> createState() =>
      _ShareStateUsingConstructorState();
}

class _ShareStateUsingConstructorState
    extends State<ShareStateUsingConstructor> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyWidget(count: _count),
        ElevatedButton(
          onPressed: () {
            _count++;
          },
          child: Text("Increment"),
        ),
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  final int count;

  const MyWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Text(count.toString());
  }
}

///2. Using inherited Widgets////////////////////////////////////////////////
class MyCounter extends InheritedWidget {
  final int count;
  final Function() increment;

  const MyCounter({
    super.key,
    required this.increment,
    required this.count,
    required super.child,
  });

  static MyCounter of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<MyCounter>();
    assert(result != null, 'No CounterState found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MyCounter oldWidget) =>
      oldWidget.count != oldWidget.count;
}

class MyCounterMainScreen extends StatefulWidget {
  const MyCounterMainScreen({super.key});

  @override
  State<MyCounterMainScreen> createState() => _MyCounterMainScreenState();
}

class _MyCounterMainScreenState extends State<MyCounterMainScreen> {
  var _count = 0;

  void _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyCounter(
      increment: _increment,
      count: _count,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CounterText(), CounterIncrement()],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = MyCounter.of(context).count.toString();
    return Text("Counter: $counter");
  }
}

class CounterIncrement extends StatelessWidget {
  const CounterIncrement({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        MyCounter.of(context).increment();
      },
      child: Text("Increment Count"),
    );
  }
}

/// 3. Using Listenable //////////////////////////////////////////////////////
class CounterNotifier extends ChangeNotifier {
  var _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class CounterNotifierListenable extends StatelessWidget {
  const CounterNotifierListenable({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = CounterNotifier();
    return ListenableBuilder(
      listenable: counter,
      builder: (context, child) {
        return Column(
          children: [
            Text(counter.count.toString()),
            ElevatedButton(
              onPressed: () {
                counter.increment();
              },
              child: Text("Increment"),
            ),
          ],
        );
      },
    );
  }
}

/// 4. Using Listenable with MVVM ////////////////////////////////////////////
class Todo {
  int id;
  String title;
  String description;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });
}

class TodoViewModel extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  bool get allCompleted => _todos.every((element) => element.isCompleted);

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(int id) {
    _todos.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void completeTodo(int id) {
    final index = _todos.indexWhere((element) => element.id == id);
    _todos[index].isCompleted = !_todos[index].isCompleted;
    notifyListeners();
  }
}

class TodoVMState extends InheritedWidget {
  final TodoViewModel viewModel;

  const TodoVMState({super.key, required this.viewModel, required super.child});

  static TodoVMState of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<TodoVMState>();
    assert(result != null, 'No CounterState found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TodoVMState oldWidget) =>
      oldWidget.viewModel != oldWidget.viewModel;
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = TodoViewModel();
    return TodoVMState(
      viewModel: viewModel,
      child: Scaffold(
        body: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return viewModel._todos.isEmpty
                ? const Center(child: Text('No Todos'))
                : TodoItemList();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddTodoDialog(context, viewModel),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

void _showAddTodoDialog(BuildContext context, TodoViewModel viewModel) {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Add Todo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                hintText: 'Enter todo title',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Enter todo description',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                viewModel.addTodo(
                  Todo(
                    id: Random().nextInt(1000000),
                    title: titleController.text,
                    description: descriptionController.text,
                    isCompleted: false,
                  ),
                );
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

class TodoItemList extends StatelessWidget {
  const TodoItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = TodoVMState.of(context).viewModel;
    return ListView.builder(
      itemCount: viewModel.todos.length,
      itemBuilder: (context, index) {
        final todo = viewModel.todos[index];
        return ListTile(
          title: Text(todo.title),
          subtitle: Text(todo.description),
          trailing: Checkbox(
            value: todo.isCompleted,
            onChanged: (value) {
              viewModel.completeTodo(todo.id);
            },
          ),
        );
      },
    );
  }
}
