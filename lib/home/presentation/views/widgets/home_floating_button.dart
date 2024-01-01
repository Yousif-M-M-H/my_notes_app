import 'package:flutter/material.dart';

class HomeFloatingButton extends StatelessWidget {
  const HomeFloatingButton({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: const Color(0xff252525),
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
