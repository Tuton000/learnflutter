import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My App', // Used by OS task switcher
      home: SafeArea(child: MyScaffold()),
    ),
  );
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // Material is conceptual piece of paper
    // on which the UI appears
    return Material(
      // Column is a vertical linear layout
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
          ),
          const Expanded(child: Center(child: Text('Hello World!'))),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  // Field variables in a widget subclass are always marked as final

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        // Row is a horizontal liner layout
        children: [
          IconButton(
            onPressed: null, // null disable the button
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
          ),
          // Expanded expands it's child
          // to fill the available space
          Expanded(child: title),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          ),
        ],
      ),
    );
  }
}
