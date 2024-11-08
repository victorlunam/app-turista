import 'package:flutter/material.dart' hide Badge;
import 'package:app_turista/utils/global_variables.dart';
import 'package:badges/badges.dart';
import 'package:flutter_svg/svg.dart';

const int countNotification = 2;

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
    required this.currentIndex,
    this.iconColor,
    this.backgroundColor,
    this.isReel = false,
  });

  final int currentIndex;
  final Color? iconColor;
  final Color? backgroundColor;
  final bool isReel;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late List<BottomNavigationBarItem> bottomNavigation = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/home.svg',
        height: globalSizeIcon,
        color: widget.currentIndex == 0
            ? const Color(0xFF1B8F26)
            : widget.iconColor,
      ),
      label: 'Inicio',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/moments.svg',
        height: globalSizeIcon,
        color: widget.currentIndex == 1
            ? const Color(0xFF1B8F26)
            : widget.iconColor,
      ),
      label: 'Momentos',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/create.svg',
        height: globalSizeIcon,
      ),
      label: 'Crear',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/reels.svg',
        height: globalSizeIcon,
        color: widget.currentIndex == 3
            ? const Color(0xFF1B8F26)
            : widget.iconColor,
      ),
      label: 'Reels',
    ),
    BottomNavigationBarItem(
      icon: Badge(
        badgeContent: Text(
          countNotification.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
        child: SvgPicture.asset(
          'assets/icons/messages.svg',
          height: globalSizeIcon,
          color: widget.currentIndex == 4
              ? const Color(0xFF1B8F26)
              : widget.iconColor,
        ),
      ),
      label: 'Mensajes',
    ),
  ];

  _handleChangeSelectedIndex(int index) {
    Map<int, String> handleNavigation = {
      0: '/home',
      1: '/home/moments',
      2: '/camera',
      3: '/home/reels',
      4: '/home/messages'
    };

    if (widget.currentIndex != index) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        handleNavigation[index]!,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: bottomNavigation,
      currentIndex: widget.currentIndex,
      onTap: _handleChangeSelectedIndex,
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: widget.backgroundColor ?? Colors.white,
      selectedItemColor: widget.isReel ? Colors.white : null,
      unselectedItemColor: widget.isReel ? Colors.white : null,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    );
  }
}
