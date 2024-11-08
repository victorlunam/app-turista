import 'package:app_turista/presentation/profile/widgets/profile_favorites.dart';
import 'package:app_turista/presentation/profile/widgets/profile_moments.dart';
import 'package:app_turista/presentation/profile/widgets/profile_private.dart';
import 'package:app_turista/presentation/profile/widgets/profile_reels.dart';

import 'package:app_turista/models/user.dart';
import 'package:app_turista/presentation/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart';
import 'package:app_turista/utils/global_variables.dart';

int countNotification = 2;

class ProfilePageArguments {
  final bool isOwner;
  ProfilePageArguments({this.isOwner = false});
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    this.isOwner = false,
  });

  final bool isOwner;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: widget.isOwner ? 4 : 2, vsync: this);
  int _indexTabBar = 0;

  final User user = User(
    username: 'Joselu123',
    fullname: 'Jose Luis Martinez',
    biography:
        'Apasionado de los atardeceres y las cosas sencillas. Gusto por la fotografía, los atardeceres y la música.',
    photo: 'assets/images/users/user_1.png',
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
        child: SvgPicture.asset(
          'assets/icons/bell.svg',
          height: globalSizeIcon,
        ),
      ),
    ),
    IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'assets/icons/search.svg',
        height: globalSizeIcon,
      ),
    ),
    IconButton(
      onPressed: () => Navigator.pushNamed(context, '/profile/settings'),
      icon: SvgPicture.asset(
        'assets/icons/bars.svg',
        height: globalSizeIcon,
      ),
    ),
  ];

  late final tabBarTabs = [
    Tab(
      icon: SvgPicture.asset(
        'assets/icons/grid.svg',
        color: _indexTabBar != 0 ? const Color(0xFF939393) : Colors.black,
        height: globalSizeIcon,
      ),
    ),
    Tab(
      icon: SvgPicture.asset(
        'assets/icons/play.svg',
        color: _indexTabBar != 1 ? const Color(0xFF939393) : Colors.black,
        height: globalSizeIcon,
      ),
    ),
    Tab(
      icon: SvgPicture.asset(
        'assets/icons/bookmark.svg',
        color: _indexTabBar != 2 ? const Color(0xFF939393) : Colors.black,
        height: globalSizeIcon,
      ),
    ),
    Tab(
      icon: SvgPicture.asset(
        'assets/icons/look.svg',
        color: _indexTabBar != 3 ? const Color(0xFF939393) : Colors.black,
        height: globalSizeIcon,
      ),
    ),
  ];

  late final tabBarViews = const [
    ProfileMoments(),
    ProfileReels(),
    ProfileFavorites(),
    ProfilePrivate(),
  ];

  openAlertBox() => showDialog(
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
                          user.photo,
                        ),
                      ),
                      const SizedBox(height: globalSpacing * 2),
                      Text(user.username),
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
                    widget.isOwner
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () => Navigator.pushNamed(
                                context,
                                '/profile/edit',
                                arguments: user,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B8F26),
                              ),
                              child: const Text(
                                'Editar Perfil',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 120,
                                child: OutlinedButton(
                                  onPressed: openAlertBox,
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
                              ),
                              const SizedBox(width: globalSpacing),
                              SizedBox(
                                height: 40,
                                width: 120,
                                child: ElevatedButton(
                                  onPressed: () => Navigator.pushNamed(
                                    context,
                                    '/chat',
                                    arguments: user,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B8F26),
                                  ),
                                  child: const Text(
                                    'Mensaje',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                    tabs:
                        widget.isOwner ? tabBarTabs : tabBarTabs.sublist(0, 2),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: widget.isOwner ? tabBarViews : tabBarViews.sublist(0, 2),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),
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
