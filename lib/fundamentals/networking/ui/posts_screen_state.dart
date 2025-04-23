import 'package:flutter/cupertino.dart';
import 'package:flutter_training/fundamentals/networking/ui/view_modal.dart';

class PostScreenState extends InheritedWidget {
  final PostViewModal screenVM;

  const PostScreenState({super.key, required this.screenVM, required super.child});

  static PostScreenState of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<PostScreenState>();
    assert(result != null, 'No CounterState found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(PostScreenState oldWidget) =>
      oldWidget.screenVM != oldWidget.screenVM;
}