import 'package:appturista/presentation/profile/page.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:appturista/utils/global_variables.dart';
import 'package:flutter_svg/svg.dart';

List<Widget> buildActions(BuildContext context) {
  return [
    IconButton(
      onPressed: () => Navigator.pushNamed(context, '/notifications'),
      icon: Badge(
        badgeContent: Text(
          globalCountNotification.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
        child: SvgPicture.asset(
          'assets/icons/bell.svg',
          height: globalSizeIcon,
        ),
      ),
    ),
    IconButton(
      onPressed: () => Navigator.pushNamed(context, '/search'),
      icon: SvgPicture.asset(
        'assets/icons/search.svg',
        height: globalSizeIcon,
      ),
    ),
    IconButton(
      onPressed: () => Navigator.pushNamed(
        context,
        '/profile',
        arguments: ProfilePageArguments(isOwner: true),
      ),
      icon: SvgPicture.asset(
        'assets/icons/user.svg',
        height: globalSizeIcon,
      ),
    ),
  ];
}
