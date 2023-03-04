import 'package:flutter/material.dart';

import '../project_colors.dart';

class InputTextFormFields extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  TextInputType? textInputType;
  IconData? suffixIcon;
  bool obscurePassword;
  TextEditingController? controller;


  InputTextFormFields(
      {super.key,
      required this.label,
      required this.prefixIcon,
      this.suffixIcon,
      this.textInputType,
        this.controller,
      this.obscurePassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscurePassword,
      keyboardType: textInputType,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(color: AppColors.primaryColorShade),
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.primaryColor,
        ),
        suffixIcon: Icon(
          suffixIcon,
          color: AppColors.primaryColor,
        ),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(width: 2.0, color: AppColors.primaryColorShade),
        ),
      ),
    );
  }
}
