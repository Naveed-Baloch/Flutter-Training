import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
      BlocProvider(
        create: (BuildContext context) => CounterBloc(0),
        child: const MaterialApp(home: CounterApp()),
      )
  );
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return SafeArea(
      child: BlocListener<CounterBloc, int>(
        listener: (context, state) {
          if(state == 5) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Counter reached 5!')),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Counter App')),
          body: Center(child: Text('${counterBloc.state}')),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  counterBloc.add(CounterIncrementPressed());
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  counterBloc.add(CounterDecrementPressed());
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Define the Events
sealed class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

/// Define the State
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(super.initialState) {
    on<CounterIncrementPressed>(_increment);
    on<CounterDecrementPressed>(_decrement);
  }

  void _increment(event, emit) {
    emit(state + 1);
  }

  void _decrement(event, emit) {
    emit(state - 1);
  }
}
