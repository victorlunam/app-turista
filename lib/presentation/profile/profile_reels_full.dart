import 'package:appturista/utils/global_variables.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

int countNotification = 2;

class ProfileReelsFull extends StatefulWidget {
  const ProfileReelsFull({Key? key}) : super(key: key);

  @override
  State<ProfileReelsFull> createState() => _ProfileReelsFullState();
}

class _ProfileReelsFullState extends State<ProfileReelsFull> {
  List<BottomNavigationBarItem> bottomNavigation = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/home.svg',
        color: Colors.white,
      ),
      label: 'Inicio',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/moments.svg',
        color: Colors.white,
      ),
      label: 'Momentos',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/create.svg'),
      label: 'Crear',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/reels.svg',
        color: Colors.white,
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
          color: Colors.white,
        ),
      ),
      label: 'Mensajes',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/portrait.jpg'),
              fit: BoxFit.cover),
        ),
        alignment: Alignment.bottomCenter,
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: SvgPicture.asset(
                      'assets/icons/back.svg',
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Joselu123',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 35),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: globalSpacing * 2, horizontal: globalSpacing),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/users/user_1.png'),
                            ),
                            const SizedBox(width: globalSpacing),
                            Text(
                              'Jose Luis Trujillo',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                        const Text(
                          'Las maravillas que nos ofrece nuestro Perú',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              (MediaQuery.of(context).size.height * 0.5) - 100),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/favorite_filled.svg',
                            color: const Color(0xFFFF2953),
                            height: 40,
                          ),
                          const Text(
                            '270',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: globalSpacing * 2),
                          SvgPicture.asset(
                            'assets/icons/messages.svg',
                            color: Colors.white,
                            height: 40,
                          ),
                          const Text(
                            '38',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: globalSpacing * 2),
                          SvgPicture.asset(
                            'assets/icons/shared.svg',
                            color: Colors.white,
                            height: 40,
                          ),
                          const Text(
                            '21',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomNavigation,
        elevation: 0,
        backgroundColor: const Color(0xFF222423),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
