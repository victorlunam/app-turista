import 'package:appturista/components/profile_favorites.dart';
import 'package:appturista/components/profile_moments.dart';
import 'package:appturista/components/profile_private.dart';
import 'package:appturista/components/profile_reels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart';
import 'package:appturista/utils/global_variables.dart';

int countNotification = 2;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 4, vsync: this);
  int _indexTabBar = 0;

  late final List<Widget> actions = [
    IconButton(
      onPressed: () {},
      icon: Badge(
        badgeContent: Text(
          countNotification.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
        child: SvgPicture.asset('./assets/icons/bell.svg'),
      ),
    ),
    IconButton(
      onPressed: () {},
      icon: SvgPicture.asset('./assets/icons/search.svg'),
    ),
    IconButton(
      onPressed: () {},
      icon: SvgPicture.asset('./assets/icons/bars.svg'),
    ),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joselu124'),
        automaticallyImplyLeading: false,
        actions: actions,
      ),
      body: SafeArea(
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const SizedBox(height: globalSpacing),
              CircleAvatar(
                backgroundImage:
                    const AssetImage('./assets/images/users/user_1.png'),
                radius: MediaQuery.of(context).size.width * 0.15,
              ),
              const SizedBox(height: globalSpacing),
              const Text(
                'Jose Luis Martinez',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: globalSpacing),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: globalSpacing),
                child: Text(
                  'Apasionado de los atardeceres y las cosas sencillas. Gusto por la fotografía, los atardeceres y la música.',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: globalSpacing),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildButton(context, '100', 'Seguidores'),
                    buildDivider(),
                    buildButton(context, '50', 'Siguiendo'),
                    buildDivider(),
                    buildButton(context, '53', 'Momentos'),
                  ],
                ),
              ),
              const SizedBox(height: globalSpacing),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Editar Perfil',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF1B8F26),
                  ),
                ),
              ),
              const SizedBox(height: globalSpacing),
              TabBar(
                padding: const EdgeInsets.all(globalSpacing),
                controller: _tabController,
                indicatorColor: Colors.black,
                onTap: (index) => setState(() {
                  _indexTabBar = index;
                }),
                tabs: [
                  Tab(
                    icon: SvgPicture.asset(
                      './assets/icons/grid.svg',
                      color: _indexTabBar != 0
                          ? const Color(0xFF939393)
                          : Colors.black,
                    ),
                  ),
                  Tab(
                    icon: SvgPicture.asset(
                      './assets/icons/play.svg',
                      color: _indexTabBar != 1
                          ? const Color(0xFF939393)
                          : Colors.black,
                    ),
                  ),
                  Tab(
                    icon: SvgPicture.asset(
                      './assets/icons/bookmark.svg',
                      color: _indexTabBar != 2
                          ? const Color(0xFF939393)
                          : Colors.black,
                    ),
                  ),
                  Tab(
                    icon: SvgPicture.asset(
                      './assets/icons/look.svg',
                      color: _indexTabBar != 3
                          ? const Color(0xFF939393)
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ];
          },
          body: TabBarView(controller: _tabController, children: const [
            ProfileMoments(),
            ProfileReels(),
            ProfileFavorites(),
            ProfilePrivate(),
          ]),
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

  Widget buildDivider() => const SizedBox(
        width: globalSpacing,
        height: globalSpacing * 3,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: globalSpacing / 2),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () {},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontFamily: 'Proxima Soft',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'Proxima Soft',
                fontSize: 14,
                color: Color(0xFF939393),
              ),
            ),
          ],
        ),
      );
}
