import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/presentation/widgets/bottom_navigation.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';

int countNotification = 2;

List<Map<String, dynamic>> itemsToday = [
  {
    "photo": "assets/images/users/user_1.png",
    "username": "Adolf10",
    "actionType": "follow",
    "actionDescription": "Comenzo a Seguirte",
    "actionPayload": true,
  },
  {
    "photo": "assets/images/users/user_2.png",
    "username": "Kity12",
    "actionType": "follow",
    "actionDescription": "Comenzo a Seguirte",
    "actionPayload": false,
  },
  {
    "photo": "assets/images/users/user_3.png",
    "username": "ultralord77",
    "actionType": "liked",
    "actionDescription": "Le gusto tu momento",
    "actionPayload": "assets/images/reels/1.png",
  },
  {
    "photo": "assets/images/users/user_3.png",
    "username": "ultralord77",
    "actionType": "comment",
    "actionDescription": "Comento tu momento",
    "actionPayload": "assets/images/reels/1.png",
  },
];

List<Map<String, dynamic>> items = [
  {
    "photo": "assets/images/users/user_1.png",
    "username": "Adolf10",
    "actionType": "follow",
    "actionDescription": "Comenzo a Seguirte",
    "actionPayload": false,
  },
  {
    "photo": "assets/images/users/user_2.png",
    "username": "Kity12",
    "actionType": "follow",
    "actionDescription": "Comenzo a Seguirte",
    "actionPayload": true,
  },
  {
    "photo": "assets/images/users/user_3.png",
    "username": "ultralord77",
    "actionType": "comment",
    "actionDescription": "Comento tu momento",
    "actionPayload": "assets/images/reels/1.png",
  },
];

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  switchRoute(String type) {
    Map<String, String> handleRoute = {
      "liked": "/notifications/liked",
      "comment": "/comments",
    };
    return handleRoute[type];
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
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF222423), side: const BorderSide(
                          color: Color(0x93939380),
                        ),
                      ),
                      child: const Text(
                        'Siguiendo',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B8F26),
                      ),
                      child: const Text(
                        'Seguir',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
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
        leading: buildBackButton(context),
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
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),
    );
  }
}
