// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_app_lat/util/mybutton.dart';

class DialogBoxALert extends StatelessWidget {
  const DialogBoxALert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green,
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.yellow)),
                  hintText: 'Isi Task Mu',
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(teks: 'Add', onchanged: () {}),
                SizedBox(
                  width: 8,
                ),
                MyButton(
                  teks: 'Cancel',
                  onchanged: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
