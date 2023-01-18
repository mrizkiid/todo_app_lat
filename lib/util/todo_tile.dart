// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskname;
  final bool taskCompleted;
  final Function(bool?)? onchanged;
  final Function(BuildContext)? ondelete;

  const TodoTile(
      {super.key,
      required this.taskname,
      required this.taskCompleted,
      required this.onchanged,
      required this.ondelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                  onPressed: (context) {
                    ondelete;
                  },
                  icon: Icons.delete,
                  backgroundColor: Colors.red),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.green.shade700,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(children: [
              Theme(
                data: Theme.of(context)
                    .copyWith(unselectedWidgetColor: Colors.white),
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
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ]),
          ),
        ));
  }
}
