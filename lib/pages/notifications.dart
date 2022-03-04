import 'package:appturista/utils/global_variables.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

int countNotification = 2;

List<Map<String, dynamic>> itemsToday = [
  {
    "photo": "./assets/images/users/user_1.png",
    "username": "Adolf10",
    "actionType": "follow",
    "actionDescription": "Comenzo a Seguirte",
    "actionPayload": true,
  },
  {
    "photo": "./assets/images/users/user_2.png",
    "username": "Kity12",
    "actionType": "follow",
    "actionDescription": "Comenzo a Seguirte",
    "actionPayload": false,
  },
  {
    "photo": "./assets/images/users/user_3.png",
    "username": "ultralord77",
    "actionType": "liked",
    "actionDescription": "Le gusto tu momento",
    "actionPayload": "./assets/images/reels/1.png",
  },
  {
    "photo": "./assets/images/users/user_3.png",
    "username": "ultralord77",
    "actionType": "comment",
    "actionDescription": "Comento tu momento",
    "actionPayload": "./assets/images/reels/1.png",
  },
];

List<Map<String, dynamic>> items = [
  {
    "photo": "./assets/images/users/user_1.png",
    "username": "Adolf10",
    "actionType": "follow",
    "actionDescription": "Comenzo a Seguirte",
    "actionPayload": false,
  },
  {
    "photo": "./assets/images/users/user_2.png",
    "username": "Kity12",
    "actionType": "follow",
    "actionDescription": "Comenzo a Seguirte",
    "actionPayload": true,
  },
  {
    "photo": "./assets/images/users/user_3.png",
    "username": "ultralord77",
    "actionType": "comment",
    "actionDescription": "Comento tu momento",
    "actionPayload": "./assets/images/reels/1.png",
  },
];

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<BottomNavigationBarItem> bottomNavigation = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset('./assets/icons/home.svg'),
      label: 'Inicio',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('./assets/icons/moments.svg'),
      label: 'Momentos',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('./assets/icons/create.svg'),
      label: 'Crear',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('./assets/icons/reels.svg'),
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
        child: SvgPicture.asset('./assets/icons/messages.svg'),
      ),
      label: 'Mensajes',
    ),
  ];

  switchRoute(String type) {
    Map<String, String> _handleRoute = {
      "liked": "/notifications/liked",
      "comment": "/comments",
    };
    return _handleRoute[type];
  }

  Widget _builder(
      BuildContext context, int index, List<Map<String, dynamic>> list) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundImage: AssetImage(list[index]['photo'] ?? ''),
      ),
      title: Text(list[index]['username']),
      subtitle: Text(list[index]['actionDescription']),
      onTap: list[index]['actionType'] != "follow"
          ? () => Navigator.pushNamed(
                context,
                switchRoute(list[index]['actionType']),
              )
          : () {},
      trailing: list[index]['actionType'] == "follow"
          ? (SizedBox(
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
            ))
          : Image(
              image: AssetImage(
                list[index]['actionPayload'],
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joselu124'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('./assets/icons/backbutton.svg'),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: globalSpacing * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hoy'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: itemsToday.length,
              itemBuilder: (ctx, index) => _builder(ctx, index, itemsToday),
            ),
            const Divider(),
            const Text('Esta Semana'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (ctx, index) => _builder(ctx, index, items),
            ),
          ],
        ),
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
