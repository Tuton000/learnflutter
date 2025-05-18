import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Flutter Tutorial', home: FlutterTutorial()));
}

class FlutterTutorial extends StatelessWidget {
  const FlutterTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material components
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: null,
          tooltip: 'Navigation menu',
          icon: Icon(Icons.menu),
        ),
        title: Text('Example Title'),
        actions: [
          IconButton(
            onPressed: null,
            tooltip: 'Search',
            icon: Icon(Icons.search),
          ),
        ],
      ),
      // body is the majority of the screen
      body: const Center(child: Text('Hello world!')),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
