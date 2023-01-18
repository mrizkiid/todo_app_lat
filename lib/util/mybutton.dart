import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String teks;
  final VoidCallback onchanged;

  const MyButton({Key? key, required this.teks, required this.onchanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onchanged,
        color: Colors.green.shade700,
        child: Text(
          teks,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
