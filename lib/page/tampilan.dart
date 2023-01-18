// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app_lat/util/dialog_box_alert.dart';
import 'package:todo_app_lat/util/todo_tile.dart';

class Tampilan extends StatefulWidget {
  const Tampilan({super.key});

  @override
  State<Tampilan> createState() => _TampilanState();
}

class _TampilanState extends State<Tampilan> {
  List toDoList = [
    ['Solat', false],
    ['Mengaji', true]
  ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void dialogBoxMethod() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBoxALert();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: dialogBoxMethod,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.green.shade300,
      appBar: AppBar(
        title: const Text('Todo App'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
              taskname: toDoList[index][0],
              onchanged: (p0) {
                checkboxChanged(p0, index);
              },
              taskCompleted: toDoList[index][1]);
        },
      ),
    );
  }
}
