import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_svg/svg.dart';

const int countNotification = 2;

List<BottomNavigationBarItem> bottomNavigation = [
  BottomNavigationBarItem(
    icon: SvgPicture.asset('assets/icons/home.svg'),
    label: 'Inicio',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset('assets/icons/moments.svg'),
    label: 'Momentos',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset('assets/icons/create.svg'),
    label: 'Crear',
  ),
  BottomNavigationBarItem(
    icon: SvgPicture.asset('assets/icons/reels.svg'),
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
      child: SvgPicture.asset('assets/icons/messages.svg'),
    ),
    label: 'Mensajes',
  ),
];

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key, required this.currentIndex})
      : super(key: key);

  final int currentIndex;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  _handleChangeSelectedIndex(int index) {
    Map<int, String> handleNavigation = {
      0: '/home',
      1: '/home/moments',
      2: '/camera',
      3: '/home/reels',
      4: '/chats'
    };

    Navigator.pushNamed(context, handleNavigation[index]!);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: bottomNavigation,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: widget.currentIndex,
      onTap: _handleChangeSelectedIndex,
    );
  }
}
