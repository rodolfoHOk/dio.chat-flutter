import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String label;
  final TextEditingController controller;

  const CustomFormField({
    super.key,
    this.keyboardType,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      controller: controller,
    );
  }
}
