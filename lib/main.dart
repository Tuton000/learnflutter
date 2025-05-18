import 'package:flutter/material.dart';

void main() {
  runApp(
    Center(
      child: Text(
        'Hello World!',
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.blue),
      ),
    ),
  );
}

/* This is the flutter hello world application, the app start or began from the
 * main function "void main()" and inside the main function we have the runApp()
 * function which take any widget and place that widget into the root of the
 * widget tree. So in this case the widget tree consist of two widgets Center
 * and Text widget, and the flutter framework force the root widget to cover the
 * entire screen, so the "Hello world!" will cover the entire screen.
 */

