import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_just_toast/flutter_just_toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.android),
            onPressed: (){
              Toast.show(message:"Hello world",duration: Duration.LONG);
            },)
          ],
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: Hello world\n'),
        ),
      ),
    );
  }
}
