import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: 'Flutter Tutorial', home: Scaffold(
    body: Center(child: MyButton()),
  )));
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped');
      },
      child: Container(
        height: 50.0,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.lightGreen[500],
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(child: Text('Engage')),
      ),
    );
  }
}

