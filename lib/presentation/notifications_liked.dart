import 'package:appturista/utils/global_variables.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

int countNotification = 2;

List<Map<String, dynamic>> items = [
  {
    "photo": "assets/images/users/user_1.png",
    "username": "Adolf10",
    "fullname": "Adolfo Aguilar",
    "actionPayload": true,
  },
  {
    "photo": "assets/images/users/user_2.png",
    "username": "Kity12",
    "fullname": "Kimberly Gonzales",
    "actionPayload": false,
  },
  {
    "photo": "assets/images/users/user_3.png",
    "username": "ultralord77",
    "fullname": "Jimmy Neutron",
    "actionPayload": false,
  },
  {
    "photo": "assets/images/users/user_3.png",
    "username": "ultralord77",
    "fullname": "Victor Ramos",
    "actionPayload": true,
  },
];

class NotificationsLikedPage extends StatefulWidget {
  const NotificationsLikedPage({Key? key}) : super(key: key);

  @override
  State<NotificationsLikedPage> createState() => _NotificationsLikedPageState();
}

class _NotificationsLikedPageState extends State<NotificationsLikedPage> {
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

  Widget _builder(
      BuildContext context, int index, List<Map<String, dynamic>> list) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: AssetImage(list[index]['photo'] ?? ''),
      ),
      title: Text(list[index]['username']),
      subtitle: Text(list[index]['fullname']),
      trailing: SizedBox(
        width: 120,
        child: list[index]['actionPayload']
            ? OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Siguiendo',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  primary: const Color(0xFF222423),
                  side: const BorderSide(
                    color: Color(0x93939380),
                  ),
                ),
              )
            : ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Seguir',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF1B8F26),
                ),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Me gusta'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('assets/icons/backbutton.svg'),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: globalSpacing * 2),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (ctx, index) => _builder(ctx, index, items),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomNavigation,
        elevation: 0,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
