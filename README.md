# ConditionalBuilder

Synchronous conditional widget renderer.

Lets you declaratively render a widget based on a condition, using this you can get rid of
implicit conditional statements in your code to display/hide a widget.

## Usage

After following the installation guide, you can use this widget as follow:

```dart
ConditionalBuilder(
  condition: true,
  builder: (context) {
    return Text('This gets rendered');
  },
 )

ConditionalBuilder(
  condition: false,
  builder: (context) {
    return Text('This does not get rendered, an empty Container will be rendered');
  },
)

ConditionalBuilder(
  condition: false,
  builder: (context) {
    return Text('This does not get rendered, as fallback is not null, it is used to render the fallback widget.');
  },
  fallback: (context) {
    return Text('This gets rendered');
  }
)
```
