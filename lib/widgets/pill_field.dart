import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class PillField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool obscure;

  const PillField({
    super.key,
    required this.hint,
    required this.controller,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.black87, fontSize: 15),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.inputHint, fontSize: 15),
        filled: true,
        fillColor: AppColors.inputFill,
        contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}