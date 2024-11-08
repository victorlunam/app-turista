import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.type = 'text',
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    ValueChanged<String>? onFieldSubmitted,
    this.maxLines,
    this.inputContentPadding,
    this.maxLength,
    this.minLines,
    this.counterText,
    this.focusedBorder,
    this.enabledBorder,
  });

  final TextEditingController controller;
  final String label;
  final String type;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final String? counterText;
  final EdgeInsetsGeometry? inputContentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;

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
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.type == 'text' ? false : _obscureText,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      minLines: widget.minLines,
      maxLines: widget.maxLines ?? 1,
      maxLength: widget.maxLength,
      style: const TextStyle(
        fontSize: 18,
        color: Color(0xFF212121),
      ),
      decoration: InputDecoration(
        counterText: widget.counterText,
        counterStyle: const TextStyle(
          color: Color(0xFF939393),
        ),
        contentPadding: widget.inputContentPadding,
        suffixIcon: widget.type == 'text'
            ? null
            : IconButton(
                onPressed: () => _toggle(),
                icon: _obscureText
                    ? SvgPicture.asset(
                        'assets/icons/visibility.svg',
                        height: globalSizeIcon,
                      )
                    : SvgPicture.asset(
                        'assets/icons/visibility_off.svg',
                        height: globalSizeIcon,
                      ),
              ),
        label: Text(
          widget.label,
          style: TextStyle(
            color: widget.controller.text == ''
                ? const Color(0xFF939393)
                : const Color(0xFF212121),
          ),
        ),
        focusedBorder: widget.focusedBorder ??
            const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF1B8F26), width: 3),
            ),
        enabledBorder: widget.enabledBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                  color: widget.controller.text == ''
                      ? const Color(0xFF939393)
                      : const Color(0xFF1B8F26),
                  width: 1),
            ),
      ),
    );
  }
}
