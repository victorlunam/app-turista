import 'package:appturista/utils/global_variables.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> followers = [
  {
    "fullname": "Adolfo Ramirez",
    "photoPath": "./assets/images/users/user_1.png",
    "username": "Adolf10",
    "following": true,
  },
  {
    "fullname": "Fabiana Linares",
    "photoPath": "./assets/images/users/user_2.png",
    "username": "lily34",
    "following": true,
  },
  {
    "fullname": "Victor Perez",
    "photoPath": "./assets/images/users/user_3.png",
    "username": "vicper",
    "following": false,
  },
];

class ProfileFollowers extends StatelessWidget {
  const ProfileFollowers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: followers.length,
      itemBuilder: (BuildContext ctx, int index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              followers[index]['photoPath'] ?? '',
            ),
          ),
          title: Text(followers[index]['username']),
          subtitle: Text(followers[index]['fullname']),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!followers[index]['following'])
                ElevatedButton(
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
              const SizedBox(
                width: globalSpacing,
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Eliminar',
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
              ),
            ],
          ),
        );
      },
    );
  }
}
