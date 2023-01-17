// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskname;
  final bool? taskCompleted;
  Function(bool?)? onchanged;

  TodoTile(
      {super.key,
      required this.taskname,
      required this.taskCompleted,
      required this.onchanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.green.shade700,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(children: [
          Theme(
            data:
                Theme.of(context).copyWith(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: taskCompleted,
              onChanged: onchanged,
              // activeColor: Colors.white,
              checkColor: Colors.white,
            ),
          ),
          Text(
            taskname,
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
