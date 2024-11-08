import 'package:flutter/material.dart';
import 'package:app_turista/utils/global_variables.dart';

class AppBarTextField extends StatelessWidget {
  const AppBarTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.focusNode,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChanged,
      controller: controller,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        hintText: 'Buscar',
        hintStyle: const TextStyle(
          fontSize: 16,
        ),
        filled: true,
        fillColor: const Color(0xFFF1F1F1),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(globalSpacing * 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(globalBorderRadius * 2),
        ),
      ),
    );
  }
}
