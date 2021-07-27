import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowTut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      mainAxisSize: MainAxisSize.max,
      children: [BlueBox(), BlueBox(), BlueBox(), BlueBox()],
    )));
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    )]);
  }
}
