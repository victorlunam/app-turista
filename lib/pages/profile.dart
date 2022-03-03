import 'package:appturista/components/profile_favorites.dart';
import 'package:appturista/components/profile_moments.dart';
import 'package:appturista/components/profile_private.dart';
import 'package:appturista/components/profile_reels.dart';
import 'package:appturista/models/user.dart';
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

  final User user = User(
    username: 'Joselu123',
    fullname: 'Jose Luis Martinez',
    biography:
        'Apasionado de los atardeceres y las cosas sencillas. Gusto por la fotografía, los atardeceres y la música.',
    photo: './assets/images/users/user_1.png',
  );

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
      onPressed: () => Navigator.pushNamed(context, '/profile/settings'),
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
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                collapsedHeight: 350,
                expandedHeight: 350,
                automaticallyImplyLeading: false,
                flexibleSpace: Column(
                  children: [
                    const SizedBox(height: globalSpacing),
                    CircleAvatar(
                      backgroundImage: AssetImage(user.photo),
                      radius: MediaQuery.of(context).size.width * 0.15,
                    ),
                    const SizedBox(height: globalSpacing),
                    Text(
                      user.fullname,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: globalSpacing),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: globalSpacing),
                      child: Text(
                        user.biography,
                        style: const TextStyle(
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
                          buildButton(
                            context,
                            '100',
                            'Seguidores',
                            '/profile/followersAndFollowings',
                            indexTab: 0,
                          ),
                          buildDivider(),
                          buildButton(
                            context,
                            '50',
                            'Siguiendo',
                            '/profile/followersAndFollowings',
                            indexTab: 1,
                          ),
                          buildDivider(),
                          buildButton(
                            context,
                            '53',
                            'Momentos',
                            '/followers',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: globalSpacing),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          '/profile/edit',
                          arguments: user,
                        ),
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
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: ProfileDelegate(
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
                ),
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

  Widget buildButton(
    BuildContext context,
    String value,
    String text,
    String pathRoute, {
    int? indexTab,
  }) =>
      MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: globalSpacing / 2),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () =>
            Navigator.pushNamed(context, pathRoute, arguments: indexTab),
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

class ProfileDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  ProfileDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
