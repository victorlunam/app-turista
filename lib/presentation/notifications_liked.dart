import 'package:appturista/presentation/widgets/appbar_backbutton.dart';
import 'package:appturista/presentation/widgets/bottom_navigation.dart';
import 'package:appturista/utils/global_variables.dart';
import 'package:flutter/material.dart';

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
        leading: buildBackButton(context),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: globalSpacing * 2),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (ctx, index) => _builder(ctx, index, items),
      ),
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),
    );
  }
}
