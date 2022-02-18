import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.type = 'text',
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String type;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  // Toggle obscureText
  void _toggle() => setState(() {
        _obscureText = !_obscureText;
      });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.type == 'text' ? false : _obscureText,
      style: const TextStyle(
        fontSize: 18,
        color: Color(0xFF212121),
      ),
      decoration: InputDecoration(
        suffixIcon: widget.type == 'text'
            ? null
            : IconButton(
                onPressed: () => _toggle(),
                icon: _obscureText
                    ? SvgPicture.asset('./assets/icons/visibility.svg')
                    : SvgPicture.asset('./assets/icons/visibility_off.svg'),
              ),
        label: Text(
          widget.label,
          style: const TextStyle(color: Color(0xFF212121)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF1B8F26), width: 3),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: widget.controller.text == ''
                  ? Colors.grey
                  : const Color(0xFF1B8F26),
              width: 3),
        ),
      ),
    );
  }
}
