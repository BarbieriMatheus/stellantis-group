import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Function()? onPressed;
  String label;

  Button({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
          primary: Colors.cyan, minimumSize: Size(248, 40)),
    );
  }
}
