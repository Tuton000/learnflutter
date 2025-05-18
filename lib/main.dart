import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Flutter Tutorial', home: Scaffold(
    body: Center(child: Counter()),
  )));
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  int _counter = 0;

  void _increment() {
    setState(() {
      /* This call to setState tell the flutter framework tha something has
      changed in this state, which causes to rerun the build method below so
      that the display reflect the updated values. If change _counter without
      calling the setState then the build method won't called again and so
      nothing would be appear to happen.
      */
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    /* This method is rerun every time the seState is called, for instance
    as done by the increment method above. The flutter framework has been
    optimize to rerunning the build method fast, so that you can just rebuild
    anything that need to be updated rather than having individually changes
    instances of widgets.
    */

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ElevatedButton(onPressed: _increment, child: Text('Increment')),
        CounterIncrementor(onPressed: _increment),
        const SizedBox(width: 16),
        CounterDisplay(count: _counter),
        // Text('Count $_counter')
      ],
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}


class CounterIncrementor extends StatelessWidget {
  const CounterIncrementor({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text('Increment'));
  }
}





