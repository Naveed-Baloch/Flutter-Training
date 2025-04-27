import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Container(
          color: Colors.white,
          child: Material(child: LifeCycleTestHome()),
        ),
      ),
    ),
  );
}

///1. Widgets lifecycles
///2. Keys
///3. Global Keys

///1. Widgets lifecycles
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({super.key}) {
    print("stateless: Constructor");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LifeCycleTestHome extends StatefulWidget {
  const LifeCycleTestHome({super.key});

  @override
  State<LifeCycleTestHome> createState() => _LifeCycleTestHomeState();
}

class _LifeCycleTestHomeState extends State<LifeCycleTestHome> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: index == 0 ? MyStatefulWidget() : MyStatelessWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = index == 0 ? 1 : 0;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() {
    print("createState called");
    return _MyStatefulWidgetState();
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var count = 0;

  /// init state is called after createState method
  @override
  void initState() {
    print("initState called");
    super.initState();
  }

  /// didChangeDependencies is called after init state or when dependencies changes provided using inherited widgets
  @override
  void didChangeDependencies() {
    print("didChangeDependencies called");
    super.didChangeDependencies();
  }

  /// after initState-> didChangeDependencies
  @override
  Widget build(BuildContext context) {
    print("build called");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Hello"),
          ElevatedButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: Text("Count: $count"),
          ),
        ],
      ),
    );
  }

  /// didUpdateWidget is called when values are changed from parents
  @override
  void didUpdateWidget(covariant MyStatefulWidget oldWidget) {
    print("didUpdateWidget called");
    super.didUpdateWidget(oldWidget);
  }

  /// reassemble is called when hot reload is done which guaranteed the build method calls
  @override
  void reassemble() {
    print("reassemble called");
    super.reassemble();
  }

  /// Flutter calls this method when widgets is coming from deactivate state to activate state
  @override
  void activate() {
    print("activate called");
    super.activate();
  }

  /// Calls before the onDispose
  @override
  void deactivate() {
    print("deactivate called");
    super.deactivate();
  }

  /// dispose is called when widget is removed from the widget tree
  @override
  void dispose() {
    print("dispose called");
    super.dispose();
  }
}
