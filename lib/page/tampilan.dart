import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app_lat/util/todo_tile.dart';

class Tampilan extends StatelessWidget {
  const Tampilan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade300,
      appBar: AppBar(
        title: const Text('Todo App'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TodoTile(
              taskname: 'Mengaji', onchanged: (p0) {}, taskCompleted: true),
        ],
      ),
    );
  }
}
