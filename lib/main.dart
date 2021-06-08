// import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  static List listItems = [
    {
      'height': 50.0,
      'color': 0xFFFF5733,
      'textContent': 'que ondaa',
    },
    {
      'height': 50.0,
      'color': 0xFF33FF58,
      'textContent': 'Hola?',
    },
    {
      'height': 50.0,
      'color': 0xFF0088CC,
      'textContent': 'Aaaadios',
    }
  ];

  List<Widget> listOfWidgets = listItems.map(
    (item) {
      return Container(
        height: item['height'],

        // One example of HEX code would look like #0077CC.
        //
        // Replace # with 0xFF, so it becomes 0xFF0077CC
        // Your custom color is ready Color(0xFF0077CC)
        color: new Color(item['color']),
        child: Center(child: Text(item['textContent'])),
      );
    }
  ).toList();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo list'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          // children: listOfWidgets,
          children: listOfWidgets
        )
      )
    );
  }
}