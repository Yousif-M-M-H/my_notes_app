import 'package:flutter/material.dart';

class CustomIconContainerAppBar extends StatelessWidget {
  const CustomIconContainerAppBar({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: const Color(0xFF3B3B3B),
          borderRadius: BorderRadius.circular(16)),
      child: Icon(icon),
    );
  }
}
