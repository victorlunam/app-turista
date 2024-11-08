import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(globalSpacing),
      color: Colors.grey,
      child: Row(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Buscar',
              hintStyle: TextStyle(color: Color(0xff707070)),
              filled: true,
              fillColor: Color(0xFFF1F1F1),
              border: OutlineInputBorder(),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              color: const Color(0xFF939393),
              height: globalSizeIcon,
            ),
          )
        ],
      ),
    );
  }
}
