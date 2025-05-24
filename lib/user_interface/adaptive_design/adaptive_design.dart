import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Adaptive & Responsive Design approach
/// Step1 : Abstract -> Decide which Widgets Needs to be responsive
/// Step2 : Measure -> Measure the available Size
/// Step3 : Branch -> Show Different Widgets based on the measurements

/// 1. Safe Area -> prevents the Display Cutout padding
/// 2. Media Query -> Gives the size of the window
///     a. Provides the info about accessibility, Voice over talkback & color contrast
///     b. Also provides info about the folding display or hinge
/// 3. SafeArea Uses the MediaQuery behind the scenes
/// 4. If MediaQuery is applied multiple times then the it keep adding padding
/// 5. But safe Area will not add the padding if nested.

/// Large Screen Devices and Foldable
/// Large Screens Solutions
///   1. [GridView]
/// Foldables
///   1. Don't Lock the Orientations
///   2. Use the Physical Dimensions instead of media query
///     a. We can use the [Display] Api
///   3. Navigation
///     a. We have to switch b/w [BottomNavigationbar] and [NavigationTrail]

/// User Inputs & accessibility
/// We will need to support
///   1. Keyboard
///   2. Scroll wheel
///   3. Right Click
///   4. Hover
///   these works mostly with Material Widgets But for the Custom Widget we need to implement those
///   1. Scroll wheel for Custom Widgets
///   2. & many more
///

/// Automatically Platform adaption
/// Most of the materials widgets have the option to automatically adapt with the platform
/// eg AlertDialog.adaptive()

/// Best Practices for Adaptive Designs
/// 1. Break down the Complex widget into smaller widgets
/// 2. Use const for better performance.
/// 3. Don't Lock screen orientations
/// 4. Avoid checking for Hardware types eg isTablet or isPhone
///
void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Container(
          color: Colors.white,
          child: Material(child: AdaptiveDialogExample()),
        ),
      ),
    ),
  );
}

class AdaptiveDesign extends StatelessWidget {
  const AdaptiveDesign({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    print("isLandscape: ${mediaQuery.isLandscape}");
    print("Building");
    return const SafeArea(child: Text("data"));
  }
}

extension MediaQueryExtension on MediaQueryData {
  bool get isLandscape => orientation == Orientation.landscape;
}

class PhysicalDisplay extends StatefulWidget {
  const PhysicalDisplay({super.key});

  @override
  State<PhysicalDisplay> createState() => _PhysicalDisplayState();
}

class _PhysicalDisplayState extends State<PhysicalDisplay> {
  FlutterView? _view;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _view = View.maybeOf(context);
  }

  @override
  Widget build(BuildContext context) {
    final Display? display = _view?.display;
    final mediaQuery = MediaQuery.of(context);
    print("isLandscape: ${mediaQuery.size}");
    print("display ${display?.size.width}");
    return const Placeholder();
  }
}

class ScrollWheel extends StatelessWidget {
  const ScrollWheel({super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (event) {
        print("object");
        if (event is PointerScrollEvent) {
          // Scrollable.ensureVisible(context);
          print("Listener" + event.scrollDelta.dy.toString());
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            100,
            (index) =>
                Text("data", style: Theme.of(context).textTheme.headlineMedium),
          ),
        ),
      ),
    );
  }
}

class AdaptiveDialogExample extends StatelessWidget {
  const AdaptiveDialogExample({super.key});

  Widget adaptiveAction({
    required BuildContext context,
    required VoidCallback onPressed,
    required Widget child,
  }) {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: onPressed, child: child);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: onPressed, child: child);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          () => showAdaptiveDialog<String>(
            context: context,
            builder:
                (BuildContext context) => AlertDialog.adaptive(
                  title: const Text('AlertDialog Title'),
                  content: const Text('AlertDialog description'),
                  actions: <Widget>[
                    adaptiveAction(
                      context: context,
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    adaptiveAction(
                      context: context,
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
          ),
      child: const Text('Show Dialog'),
    );
  }
}
