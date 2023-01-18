// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app_lat/page/tampilan.dart';

void main() async {
  await Hive.initFlutter();

  late Box box;
  //open box
  box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green, unselectedWidgetColor: Colors.white),
      home: Tampilan(),
    );
  }
}
