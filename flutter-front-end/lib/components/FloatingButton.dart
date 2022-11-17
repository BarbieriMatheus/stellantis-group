import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  Function() onPressed;

  FloatingButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.cyan,
      foregroundColor: Colors.white,
      child: const Icon(Icons.add),
      onPressed: onPressed,
    );
  }
}
