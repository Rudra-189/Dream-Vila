import 'package:flutter/material.dart';

class CommonCheckbox extends StatelessWidget {
  final bool value;
  final String text;
  Function(bool?) onChanged;
  CommonCheckbox({super.key, required this.value, required this.text,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          hoverColor: Colors.white,
          value: value,
          onChanged: onChanged
        ),
        Text(text),
      ],
    );
  }
}
