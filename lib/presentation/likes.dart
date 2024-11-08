import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> followings = [
  {
    "fullname": "Adolfo Ramirez",
    "photoPath": "assets/images/users/user_1.png",
    "username": "Adolf10",
  },
  {
    "fullname": "Fabiana Linares",
    "photoPath": "assets/images/users/user_2.png",
    "username": "lily34",
  },
  {
    "fullname": "Victor Perez",
    "photoPath": "assets/images/users/user_3.png",
    "username": "vicper",
  },
];

class LikesPage extends StatefulWidget {
  const LikesPage({super.key});

  @override
  State<LikesPage> createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  openAlertBox(Map<String, dynamic> following) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          double width = MediaQuery.of(context).size.width;

          return AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            insetPadding: const EdgeInsets.all(globalSpacing),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(globalBorderRadius)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: globalSpacing),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          following['photoPath'] ?? '',
                        ),
                      ),
                      const SizedBox(height: globalSpacing * 2),
                      Text(following['username']),
                      const SizedBox(height: globalSpacing * 2),
                      const Divider(
                        color: Color(0xFFF1F1F1),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: const Color(0xFFFF2953),
                        ),
                        child: const Text('Dejar de seguir'),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: globalSpacing),
                Container(
                  width: width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.all(Radius.circular(globalBorderRadius)),
                  ),
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Cancelar'),
                  ),
                )
              ],
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildBackButton(context),
        title: const Text('Me gusta'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: followings.length,
        itemBuilder: (BuildContext ctx, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                followings[index]['photoPath'] ?? '',
              ),
            ),
            title: Text(followings[index]['username']),
            subtitle: Text(followings[index]['fullname']),
            trailing: OutlinedButton(
              onPressed: () => openAlertBox(followings[index]),
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
            ),
          );
        },
      ),
    );
  }
}
