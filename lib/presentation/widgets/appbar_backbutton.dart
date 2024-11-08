import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildBackButton(BuildContext context, {Color? color}) => IconButton(
      onPressed: () => Navigator.pop(context),
      icon: SvgPicture.asset(
        'assets/icons/backbutton.svg',
        height: globalSizeIcon,
        color: color,
      ),
    );
