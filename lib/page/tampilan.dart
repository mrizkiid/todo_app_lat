// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app_lat/database/database.dart';
import 'package:todo_app_lat/util/dialog_box_alert.dart';
import 'package:todo_app_lat/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Tampilan extends StatefulWidget {
  const Tampilan({super.key});

  @override
  State<Tampilan> createState() => _TampilanState();
}

class _TampilanState extends State<Tampilan> {
  final controllers = TextEditingController();
  final _mybox = Hive.box('mybox');
  DatabaseClass db = DatabaseClass();

  @override
  void initState() {
    // TODO: implement initState
    if (_mybox.get('OPEN') == null) {
      db.initDatabase();
    } else {
      db.loadDatabase();
    }
    super.initState();
  }

  // List toDoList = [
  //   ['Solat', false],
  //   ['Mengaji', true]
  // ];

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  void addTask() {
    setState(() {
      db.toDoList.add([controllers.text, false]);
    });
    db.openDatabase();
    controllers.clear();
    Navigator.of(context).pop();
  }

  void dialogBoxMethod() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBoxALert(
            controllers: controllers,
            onsave: addTask,
            oncancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteMethod(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.openDatabase();
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
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskname: db.toDoList[index][0],
            onchanged: (p0) {
              checkboxChanged(p0, index);
            },
            taskCompleted: db.toDoList[index][1],
            ondelete: (p0) => deleteMethod(index),
          );
        },
      ),
    );
  }
}
