import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Map<String, dynamic>> momentsList = [
  {
    "image": 'assets/images/moments/1.png',
    "username": "Joselu123",
    "userPhotoPath": "assets/images/users/user_1.png",
    "place": "Cuzco",
    "comments": 48,
    "likes": 270,
    "date": "02 Ene",
    "description": "En busca de nuevos rumbos",
  },
  {
    "image": 'assets/images/moments/2.png',
    "username": "Joselu123",
    "userPhotoPath": "assets/images/users/user_1.png",
    "place": "Mancora",
    "comments": 65,
    "likes": 340,
    "date": "04 Ene",
    "description": "Conociendo nuestro maravilloso Perú",
  },
  {
    "image": 'assets/images/moments/4.png',
    "username": "Joselu123",
    "userPhotoPath": "assets/images/users/user_1.png",
    "place": "Medellin",
    "comments": 98,
    "likes": 123,
    "date": "06 Ene",
    "description": "Ya tocaba una vuelta por Arequipa ♥️",
  },
];

class ProfileMomentsFull extends StatelessWidget {
  const ProfileMomentsFull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joselu123'),
      ),
      body: ListView.builder(
        itemCount: momentsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: globalSpacing),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: globalSpacing),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          momentsList[index]['userPhotoPath'] ?? '',
                        ),
                      ),
                      const SizedBox(width: globalSpacing),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            momentsList[index]['username'],
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              '/search/view',
                              arguments: momentsList[index]['place'],
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/pin_map.svg',
                                  color: const Color(0xFFB1B1B1),
                                  height: globalSizeIcon,
                                ),
                                const SizedBox(width: globalSpacing / 2),
                                Text(
                                  momentsList[index]['place'],
                                  style: Theme.of(context).textTheme.titleSmall,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        momentsList[index]['date'],
                        style: const TextStyle(
                          color: Color(0xFF939393),
                        ),
                      ),
                      const SizedBox(width: globalSpacing),
                      SvgPicture.asset(
                        'assets/icons/dots.svg',
                        color: const Color(0xFFB1B1B1),
                        height: globalSizeIcon,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: globalSpacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(momentsList[index]['description'] ?? ''),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '...ver más',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(momentsList[index]['image'] ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(globalSpacing),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/favorite_filled.svg',
                        color: const Color(0xFFFF2953),
                        height: globalSizeIcon,
                      ),
                      const SizedBox(width: globalSpacing / 2),
                      Text(
                        momentsList[index]['likes'].toString(),
                        style: const TextStyle(
                          color: Color(0xFFFF2953),
                        ),
                      ),
                      const SizedBox(width: globalSpacing),
                      SvgPicture.asset(
                        'assets/icons/messages.svg',
                        color: const Color(0xFFB1B1B1),
                        height: globalSizeIcon,
                      ),
                      const SizedBox(width: globalSpacing / 2),
                      Text(
                        momentsList[index]['comments'].toString(),
                        style: const TextStyle(
                          color: Color(0xFFB1B1B1),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset(
                        'assets/icons/bookmark.svg',
                        color: const Color(0xFFB1B1B1),
                        height: globalSizeIcon,
                      ),
                      const SizedBox(width: globalSpacing),
                      SvgPicture.asset(
                        'assets/icons/shared.svg',
                        color: const Color(0xFFB1B1B1),
                        height: globalSizeIcon,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
