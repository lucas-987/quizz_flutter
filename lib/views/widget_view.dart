import 'package:flutter/material.dart';

// https://medium.com/gskinner-team/flutter-widgetview-a-simple-separation-of-layout-and-logic-f0be5a537b87

abstract class WidgetView<T1, T2> extends StatelessWidget {
  final T2 state;

  T1 get widget => (state as State).widget as T1;

  const WidgetView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context);
}