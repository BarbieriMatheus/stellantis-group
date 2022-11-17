import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String hint;
  final String label;
  final Function()? onEditingComplete;
  final TextEditingController? userInputController;
  final FocusNode? focusNode;
  final IconData? icon;
  final TextInputType? textInputType;
  final FormFieldValidator<String>? validator;
  final void Function()? onTap;

  Input({
    required this.hint,
    required this.label,
    this.icon,
    this.userInputController,
    this.onEditingComplete,
    this.focusNode,
    this.textInputType,
    this.validator,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      controller: userInputController,
      keyboardType: textInputType,
      obscureText: false,
      validator: validator,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        label: Text(label),
        filled: true,
        hoverColor: Colors.blue.shade100,
        border: OutlineInputBorder(),
      ),
    );
  }
}
