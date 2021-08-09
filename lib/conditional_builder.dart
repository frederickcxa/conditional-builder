library conditional_builder;

import 'package:flutter/material.dart';

/// Runs a [WidgetBuilder]'s result if the [condition] is true.
///
/// When [condition] is true the [builder] is run. If false
/// and [fallback] is not null, [fallback] is run. If [fallback] is null and
/// [condition] is false, an empty [Container] is rendered.
///
/// Example:
///
/// ```dart
/// ConditionalBuilder(
///  condition: true,
/// builder: (context) {
///    return Text('This gets rendered');
///  },
/// )
///
/// ConditionalBuilder(
///  condition: false,
///  builder: (context) {
///    return Text('This does not get rendered, an empty Container will be rendered');
///  },
/// )
///
/// ConditionalBuilder(
///  condition: false,
///  builder: (context) {
///    return Text('This does not get rendered, as fallback is not null, it is used to render the fallback widget.');
///  },
///  fallback: (context) {
///    return Text('This gets rendered');
///  }
/// )
/// ```

class ConditionalBuilder extends StatelessWidget {
  /// Condition to control what gets rendered.
  final bool condition;

  /// Run if [condition] is true.
  final WidgetBuilder builder;

  /// Run if [condition] is false and it is not null.
  final WidgetBuilder? fallback;

  const ConditionalBuilder({
    Key? key,
    required this.condition,
    required this.builder,
    this.fallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => condition
      ? builder(context)
      : fallback != null
          ? fallback!(context)
          : Container();
}
