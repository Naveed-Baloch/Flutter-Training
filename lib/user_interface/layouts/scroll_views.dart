import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///1. SingleChildScrollView
///2. Infinite Scroll
///3. ListScrollWheel
///4. Custom Scroll Wheel
void main() {
  runApp(MaterialApp(home: Scaffold(body: CustomScrollViewExample())));
}

class SingleScrollExample extends StatelessWidget {
  const SingleScrollExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 500,
            child: Container(color: CupertinoColors.activeBlue),
          ),
          SizedBox(
            height: 500,
            child: Container(color: CupertinoColors.activeGreen),
          ),

          SizedBox(
            height: 500,
            child: Container(color: CupertinoColors.activeOrange),
          ),

          SizedBox(
            height: 500,
            child: Container(color: CupertinoColors.systemPink),
          ),
        ],
      ),
    );
  }
}

class InfiniteScrollExample extends StatelessWidget {
  InfiniteScrollExample({super.key});

  final items = List.generate(100, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.supervised_user_circle),
          title: Text(items[index]),
        );
      },
    );
  }
}

class ScrollWheelExample extends StatelessWidget {
  ScrollWheelExample({super.key});

  final items = List.generate(100, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListWheelScrollView(
        itemExtent: 100,
        perspective: 0.001,
        diameterRatio: 2,
        children: [
          ...items.map(
            (e) => Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.activeBlue,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.supervised_user_circle),
                    title: Text(e),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomScrollViewExample extends StatelessWidget {
  const CustomScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Custom Scroll View"),
              background: Image.network(
                "https://docs.flutter.dev/cookbook/img-files/effects/parallax/01-mount-rushmore.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(color: Colors.red, height: 150.0),
              Container(color: Colors.purple, height: 150.0),
              Container(color: Colors.green, height: 150.0),
              Container(color: Colors.black, height: 150.0),
              Container(color: Colors.white, height: 150.0),
              Container(color: Colors.pink, height: 150.0),
              Container(color: Colors.yellow, height: 150.0),
            ]),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            }, childCount: 20),
          ),
        ],
      ),
    );
  }
}
