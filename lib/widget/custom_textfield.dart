import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextEditingController controller;
  const CustomTextfield({
    super.key,
    required this.text,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 255, 197, 180),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            prefixIcon: Icon(icon),
          ),
        ),
      ),
    );
  }
}
