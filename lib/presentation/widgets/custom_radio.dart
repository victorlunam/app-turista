import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomRadio extends StatefulWidget {
  const CustomRadio({
    super.key,
    this.size = 10,
    this.selected = false,
  });

  final bool selected;
  final double size;

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  late bool _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        _selected = !_selected;
      }),
      child: Container(
        margin: const EdgeInsets.fromLTRB(
            globalSpacing * 2, globalSpacing, globalSpacing, globalSpacing),
        height: widget.size,
        width: widget.size,
        decoration: BoxDecoration(
          color: _selected ? const Color(0xFF1B8F26) : Colors.white,
          border: _selected ? null : Border.all(color: const Color(0xFFDFDEE2)),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: SvgPicture.asset(
            'assets/icons/check_single.svg',
            color: Colors.white,
            height: widget.size,
          ),
        ),
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final Widget icon;

  RadioModel({required this.isSelected, required this.icon});
}
