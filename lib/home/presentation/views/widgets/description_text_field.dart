import 'package:flutter/material.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({super.key, required this.descriptionController});

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: descriptionController,
      maxLines: 10,
      decoration: const InputDecoration(
        hintText: "Type Somthing...",
        hintStyle: TextStyle(fontSize: 23),
        border: InputBorder.none,
      ),
      style: const TextStyle(fontSize: 18),
    );
  }
}
