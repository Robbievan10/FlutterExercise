import 'package:flutter/material.dart';

class ProductInput extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final void Function(String)? onTextChanged;
  const ProductInput(
      {Key? key,
      required this.hint,
      required this.controller,
      this.onTextChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
          ),
          onChanged: onTextChanged,
        ),
      ],
    );
  }
}
