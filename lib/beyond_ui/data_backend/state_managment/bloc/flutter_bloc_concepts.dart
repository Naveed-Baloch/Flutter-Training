import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/beyond_ui/data_backend/state_managment/bloc/bloc_concepts.dart';

/// Flutter Bloc Concepts Outline:
/// 
/// 1. BlocBuilder
///    - Controls rebuilding of bloc widgets
///    - Uses buildWhen to conditionally rebuild
///    - Can provide bloc parameter or use context lookup
/// 
/// 2. BlocSelector
///    - Filters and selects new values based on conditions
///    - Prevents unnecessary builds (similar to Selector Provider)
///    - Transforms state values using selector function
/// 
/// 3. BlocProvider
///    - Provides bloc instance down to children widgets
///    - Enables sharing same bloc instance across widgets
///    - Accessible via BlocProvider.of<Type>(context)
///    - Can be shared across different routes
/// 
/// 4. MultiBlocProvider
///    - Provides multiple blocs to a single widget tree
///    - Cleaner alternative to nested BlocProviders
/// 
/// 5. BlocListener
///    - Listens to state changes without rebuilding UI
///    - Executes side effects (navigation, snackbars, etc.)
///    - Uses listener callback for state change reactions
/// 
/// 6. MultiBlocListener
///    - Listens to multiple blocs simultaneously
///    - Cleaner alternative to nested BlocListeners
/// 
/// 7. BlocConsumer
///    - Combines BlocBuilder and BlocListener functionality
///    - Provides listenWhen, listener, buildWhen, and builder callbacks
///    - Handles both UI rebuilding and side effects
/// 
/// 8. RepositoryProvider
///    - Provides repository instances to widget tree
///    - Similar to BlocProvider but for repositories/services
/// 
/// 9. Context Extensions
///    - context.read: Look up closest provider and retrieve value
///    - context.watch: Listen to state changes and rebuild
///    - context.select: Listen to selective values from state

void main() {
  runApp(const MaterialApp(home: BlocProviderExample()));
}

/// 1. Bloc Builder
///    We can control the rebuilding of block as well using buildWhen
///    We can provide the bloc param
///    If we don't then Bloc builder will Search using context and blocProvider()
class BlocBuilderExample extends StatelessWidget {
  const BlocBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = CounterBloc(0);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BlocBuilder<CounterBloc, int>(
            bloc: counterBloc, /// Local counter block state
            buildWhen: (previous, current) {
              return current > 0;
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Counter: $state'),
                  ElevatedButton(
                    onPressed: () {
                      counterBloc.add(CounterIncrementPressed());
                    },
                    child: const Text('Increment'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      counterBloc.add(CounterDecrementPressed());
                    },
                    child: const Text('Decrement'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      counterBloc.add(CounterResetPressed());
                    },
                    child: const Text('Reset'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      counterBloc.add(CounterSetValuePressed(10));
                    },
                    child: const Text('Set to 10'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

/// 2. Bloc Selector
///     We can modify the values of the State
///     Is used to filter out and select the new values based on certain conditions
///     It can be used to prevent unnecessary builds its like the Selector Provider

class BlocSelectorExample extends StatelessWidget {
  const BlocSelectorExample({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = CounterBloc(0);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BlocSelector<CounterBloc, int, int>(
            selector: (state) {
              return (state * 2); ///
            },
            bloc: counterBloc, /// Local counter block state
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Counter: $state'),
                  ElevatedButton(
                    onPressed: () {
                      counterBloc.add(CounterIncrementPressed());
                    },
                    child: const Text('Increment'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      counterBloc.add(CounterDecrementPressed());
                    },
                    child: const Text('Decrement'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      counterBloc.add(CounterResetPressed());
                    },
                    child: const Text('Reset'),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      counterBloc.add(CounterSetValuePressed(10));
                    },
                    child: const Text('Set to 10'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

///3. Bloc Provider
///    It can provide the bloc down to the children
///    So that the same instance of the bloc should be shared and used
///    Child can access the bloc using BlocProvider.of<Type>(context);
///    Same instance of the bloc can be provided to different route as well
class BlocProviderExample extends StatelessWidget {
  const BlocProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(0),
      child: const BlocListenerExample(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Provider Example'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, count) {
            return Text(
              '$count',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncrementPressed());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecrementPressed());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

///4. Multi Bloc Provider
/// We can provide the multiple blocs to single Main App as well like
/// MultiBlocProvider(
/// providers: [
///   BlocProvider<BlocA>(create: (context) => BlocA()),
///   BlocProvider<BlocB>(create: (context) => BlocB()),
///   BlocProvider<BlocC>(create: (context) => BlocC()),
/// ],
/// child: MyChildWidget(),
/// )

///5. Bloc Listener
///   Its more like the bloc builder with additional method listen which we can 
///   use for the listening to state changes like
class BlocListenerExample extends StatelessWidget {
  const BlocListenerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, int>(
      listener: (context, state) {
        if (state == 3) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Success!')),
          );
        }
      },
      child: const CounterView(),
    );
  }
}

///6. Multi bloc Listeners
/// We can have the multiple bloc listener as well
/// MultiBlocListener(
///   listeners: [
///     BlocListener<BlocA, BlocAState>(
///       listener: (context, state) {},
///     ),
///     BlocListener<BlocB, BlocBState>(
///       listener: (context, state) {},
///     ),
///     BlocListener<BlocC, BlocCState>(
///       listener: (context, state) {},
///     ),
///   ],
///   child: ChildA(),
/// );

///7. Bloc Consumer
///   Its has more helper callbacks like
///   BlocConsumer<BlocA, BlocAState>(
///   listenWhen: (previous, current) {
///     // return true/false to determine whether or not
///     // to invoke listener with state
///   },
///   listener: (context, state) {
///     // do stuff here based on BlocA's state
///   },
///   buildWhen: (previous, current) {
///     // return true/false to determine whether or not
///     // to rebuild the widget with state
///   },
///   builder: (context, state) {
///     // return widget here based on BlocA's state
///   },
/// );

/// 8. Repo Provider
///    This provides the Repo to it Widget
///    RepositoryProvider(
///       create: (context) => RepositoryA(),
///       child: ChildA(),
///    );

/// 9. Extension
///    1. context.read
///       Look up the closet child and retrieve the value
///    2. context.watch
///       Listen to the state changes
///    3. context.select
///       Listen to selective value
