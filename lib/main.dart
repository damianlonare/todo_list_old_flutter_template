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
      'color': Colors.blue,
      'textContent': const Center(child: Text('holi')),
    },
    {
      'height': 50.0,
      'color': Colors.yellow,
      'textContent': const Center(child: Text('jejejeje'))
    },
    {
      'height': 50.0,
      'color': Colors.red,
      'textContent': const Center(child: Text('ADIOSS'))
    }
  ];

  List<Widget> listOfWidgets = listItems.map(
    (item) {
      return Container(
        height: item['height'],
        color: item['color'],
        child: item['textContent'],
      );
    }
  ).toList();

  // List<Widget> listOfWidgets = [
  //   Container(
  //     height: 50,
  //     color: Colors.blue[500],
  //     child: const Center(child: Text('Entry A')),
  //   ),
  //   Container(
  //     height: 50,
  //     color: Colors.amber[500],
  //     child: const Center(child: Text('Entry B')),
  //   ),
  //   Container(
  //     height: 50,
  //     color: Colors.red[500],
  //     child: const Center(child: Text('Entry C')),
  //   ),
  // ];

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