import 'package:flutter/material.dart';

import '../project_colors.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Icon prefixIcon;
  final Icon? suffixIcon;
  final bool? obscureText;
  final TextInputType textInputType;

  const TextInputWidget({
    Key? key, required this.textEditingController,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(

      obscureText: obscureText!,
      controller:textEditingController,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: AppColors.white,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0.0,
            color: AppColors.primaryColor,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),

      ),

    );
  }
}


