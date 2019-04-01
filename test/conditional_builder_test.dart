import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Renders builder if `condition` is `true`', (WidgetTester tester) async {
    final renderedContainer = Container();
    await tester.pumpWidget(ConditionalBuilder(
      condition: true,
      builder: (context) => renderedContainer,
    ));

    expect(find.byWidget(renderedContainer), findsOneWidget);
  });

  testWidgets('Renders `fallback` if `condition is `false`', (WidgetTester tester) async {
    final notRenderedContainer = Container();
    final renderedContainer = Container();
    await tester.pumpWidget(ConditionalBuilder(
      condition: false,
      builder: (context) => notRenderedContainer,
      fallback: (context) => renderedContainer,
    ));

    expect(find.byWidget(notRenderedContainer), findsNothing);
    expect(find.byWidget(renderedContainer), findsOneWidget);
  });

  testWidgets('Renders empty `Container` if `condition is `false` and `fallback` is null', (WidgetTester tester) async {
    final notRenderedContainer = Container();
    await tester.pumpWidget(ConditionalBuilder(
      condition: false,
      builder: (context) => notRenderedContainer,
    ));

    expect(find.byWidget(notRenderedContainer), findsNothing);
    expect(find.byType(Container), findsOneWidget);
  });
}
