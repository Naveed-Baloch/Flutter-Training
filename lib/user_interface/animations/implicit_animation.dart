import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Animations
/// Types of Animations in Flutter
///   1. Implicit Animations
///       1. AnimatedContainer
///       2. Animated Opacity
///       3. AnimatedAlign
///       4. Text Style Animation
///       5. animated Padding
///       6. AnimatedPositionedExample
///       7. AnimatedPhysicalModelExample
///       8. Cross fade Animation
///       9.AnimatedSwitcher
///
///   2. Explicit Animations
///
void main() {
  runApp(const MaterialApp(home: MainScreen()));
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animations')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CupertinoButton(
            child: const Text('Animated Container'),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const AnimatedContainerExample(),
                ),
              );
            },
          ),
          CupertinoButton(
            child: const Text('Animated Opacity'),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const AnimatedOpacityExample(),
                ),
              );
            },
          ),
          CupertinoButton(
            child: const Text('Animated Align'),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const AnimatedAlignExample(),
                ),
              );
            },
          ),
          CupertinoButton(
            child: const Text('Text Style Animation'),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const AnimatedDefaultTextStyleExample(),
                ),
              );
            },
          ),
          CupertinoButton(
            child: const Text('Animated Padding'),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const AnimatedPaddingExample(),
                ),
              );
            },
          ),
          CupertinoButton(
            child: const Text('Animated Positioned'),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const AnimatedPositionedExample(),
                ),
              );
            },
          ),
          CupertinoButton(
            child: const Text('Animated Physical Model'),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const AnimatedPhysicalModelExample(),
                ),
              );
            },
          ),
          CupertinoButton(
            child: const Text('Animated Cross Fade'),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const AnimatedCrossFadeExample(),
                ),
              );
            },
          ),
          CupertinoButton(
            child: const Text('Animated Switcher'),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => const AnimatedSwitcherExample(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// 1 Animated Container
class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            width: _isExpanded ? 200 : 100,
            height: _isExpanded ? 200 : 100,
            color: _isExpanded ? Colors.blue : Colors.red,
            alignment: _isExpanded ? Alignment.center : Alignment.bottomRight,
            child: const Text('Tap Me!', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

/// 2 Animated Opacity
class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({super.key});

  @override
  State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedOpacity')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.purple,
                child: const Center(
                  child: Text('Fade Me', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _opacity = _opacity == 1.0 ? 0.0 : 1.0;
                });
              },
              child: const Text('Toggle Opacity'),
            ),
          ],
        ),
      ),
    );
  }
}

/// 3. AnimatedAlign
class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  AlignmentGeometry _alignment = Alignment.topLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedAlign')),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _alignment =
                _alignment == Alignment.topLeft
                    ? Alignment.topRight
                    : Alignment.topLeft;
          });
        },
        child: Container(
          color: Colors.grey[200],
          child: AnimatedAlign(
            alignment: _alignment,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
              child: const Center(child: Text('Move Me')),
            ),
          ),
        ),
      ),
    );
  }
}


/// 4. Text Style Animation
class AnimatedDefaultTextStyleExample extends StatefulWidget {
  const AnimatedDefaultTextStyleExample({super.key});

  @override
  State<AnimatedDefaultTextStyleExample> createState() =>
      _AnimatedDefaultTextStyleExampleState();
}

class _AnimatedDefaultTextStyleExampleState
    extends State<AnimatedDefaultTextStyleExample> {
  bool _isLarge = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedDefaultTextStyle')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 500),
              style: TextStyle(
                fontSize: _isLarge ? 30.0 : 16.0,
                color: _isLarge ? Colors.blue : Colors.red,
                fontWeight: _isLarge ? FontWeight.bold : FontWeight.normal,
              ),
              child: const Text('Hello Flutter!'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLarge = !_isLarge;
                });
              },
              child: const Text('Toggle Style'),
            ),
          ],
        ),
      ),
    );
  }
}


/// 5. animated Padding
class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({super.key});

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  EdgeInsetsGeometry _padding = const EdgeInsets.all(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedPadding')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey[300],
              child: AnimatedPadding(
                padding: _padding,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.orange,
                  child: const Center(child: Text('Padded!')),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _padding = _padding == const EdgeInsets.all(8.0)
                      ? const EdgeInsets.all(50.0)
                      : const EdgeInsets.all(8.0);
                });
              },
              child: const Text('Toggle Padding'),
            ),
          ],
        ),
      ),
    );
  }
}

/// 6. AnimatedPositionedExample
class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool _isMoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedPositioned')),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutBack,
            top: _isMoved ? 200 : 50,
            left: _isMoved ? 200 : 50,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isMoved = !_isMoved;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.teal,
                child: const Center(
                  child: Text(
                    'Drag Me',
                    style: TextStyle(color: Colors.white),
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

/// 7. AnimatedPhysicalModelExample
class AnimatedPhysicalModelExample extends StatefulWidget {
  const AnimatedPhysicalModelExample({super.key});

  @override
  State<AnimatedPhysicalModelExample> createState() =>
      _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState
    extends State<AnimatedPhysicalModelExample> {
  bool _isElevated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedPhysicalModel')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isElevated = !_isElevated;
                });
              },
              child: AnimatedPhysicalModel(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInCubic,
                shape: BoxShape.rectangle,
                elevation: _isElevated ? 20.0 : 0.0,
                color: _isElevated ? Colors.indigo : Colors.grey[300]!,
                shadowColor: Colors.black,
                borderRadius: _isElevated
                    ? BorderRadius.circular(20.0)
                    : BorderRadius.circular(0.0),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(
                    child: Text(
                      'Tap for Effect',
                      style: TextStyle(
                        color: _isElevated ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 8. Cross fade Animation
class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});

  @override
  State<AnimatedCrossFadeExample> createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedCrossFade')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              crossFadeState: _showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: Container(
                width: 150,
                height: 150,
                color: Colors.greenAccent,
                child: const Center(child: Text('First Widget')),
              ),
              secondChild: Container(
                width: 200,
                height: 100,
                color: Colors.amberAccent,
                child: const Center(child: Text('Second Widget')),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _showFirst = !_showFirst;
                });
              },
              child: const Text('Toggle Widgets'),
            ),
          ],
        ),
      ),
    );
  }
}

///9.AnimatedSwitcher
class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({super.key});

  @override
  State<AnimatedSwitcherExample> createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedSwitcher')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return RotationTransition(turns: animation, child: child);
              },
              child: Text(
                '$_count',
                // The `key` is crucial for AnimatedSwitcher to identify different children
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}