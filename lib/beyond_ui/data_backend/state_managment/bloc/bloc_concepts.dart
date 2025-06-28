import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

/// Bloc for State management
///   Bloc uses the streams behind the scenes
///     like stream it yield value dy using emit keyword
///   Bloc has two main types
///     Cubit
///     bloc
/// Cubit (callback)
///    Its more like the MVVM pattern where we update the state using callbacks
///    Provides the state changes
///    We can ue the callbacks to update the states
///    Simple
///    We can observe the values change using onChange
///    Support Error handling
/// bloc (Event based)
///   Its more like the MVP pattern where state changes are done using Events
///   Advanced
///   It also has the onChange as well
///   It also gives us the transitions of events as well using onTransition
///   Support Error handling

/// 1. Cubit
class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

  void reset() => emit(0);
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    if (kDebugMode) {
      print(change);
    }
  }
}

void main() {
  blocMain();
  // cubitMain();
}

void cubitMain() {
  CounterCubit counterCubit = CounterCubit(0);
  counterCubit.stream.listen((event) {
    if (kDebugMode) {
      print(event);
    }
  });
  counterCubit.increment();
  counterCubit.increment();
  counterCubit.increment();
  counterCubit.decrement();
  counterCubit.reset();
}

///2. bloc
sealed class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterResetPressed extends CounterEvent {}

class CounterSetValuePressed extends CounterEvent {
  final int value;

  CounterSetValuePressed(this.value);
}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(super.initialState) {
    on<CounterSetValuePressed>((event, emit) => emit(event.value));
    on<CounterIncrementPressed>((event, emit) => emit(state + 1));
    on<CounterDecrementPressed>((event, emit) => emit(state - 1));
    on<CounterResetPressed>((event, emit) => emit(0));
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    if (kDebugMode) {
      print(change);
    }
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    if (kDebugMode) {
      print(transition);
    }
  }
}

void blocMain() {
  CounterBloc counterBloc = CounterBloc(0);
  counterBloc.stream.listen((event) {
    if (kDebugMode) {
      print(event);
    }
  });
  counterBloc.add(CounterSetValuePressed(10));
  counterBloc.add(CounterIncrementPressed());
  counterBloc.add(CounterDecrementPressed());
  counterBloc.add(CounterResetPressed());
}
