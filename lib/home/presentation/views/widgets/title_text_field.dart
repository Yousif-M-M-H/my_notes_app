import 'package:flutter/material.dart';

class TitleTextField extends StatefulWidget {
  const TitleTextField({Key? key, required this.titleController})
      : super(key: key);
  final TextEditingController titleController;

  @override
  _TitleTextFieldState createState() => _TitleTextFieldState();
}

class _TitleTextFieldState extends State<TitleTextField> {
  double fontSize = 18.0;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.titleController,
      maxLines: 2,
      onChanged: (text) {
        setState(() {
          fontSize = 28.0;
        });
      },
      onTap: () {
        setState(() {
          fontSize = 24.0;
        });
      },
      decoration: const InputDecoration(
        hintText: "Title",
        border: InputBorder.none,
      ),
      style: TextStyle(fontSize: fontSize),
    );
  }
}
