import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'individualLook.dart';
import 'list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pokedex",
      theme: ThemeData(primarySwatch: Colors.red),
      home: MainList(),
    );
  }
}




