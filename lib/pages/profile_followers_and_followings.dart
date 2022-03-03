import 'package:appturista/components/profile_followers.dart';
import 'package:appturista/components/profile_followings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart';
import 'package:appturista/utils/global_variables.dart';

int countNotification = 2;

class ProfileFollowersAndFollowingsPage extends StatefulWidget {
  const ProfileFollowersAndFollowingsPage({Key? key, required this.indexTab})
      : super(key: key);

  final int indexTab;

  @override
  State<ProfileFollowersAndFollowingsPage> createState() =>
      _ProfileFollowersAndFollowingsPageState();
}

class _ProfileFollowersAndFollowingsPageState
    extends State<ProfileFollowersAndFollowingsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this, initialIndex: widget.indexTab);

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
      body: SafeArea(
        bottom: false,
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                toolbarHeight: AppBar().preferredSize.height * 1.5,
                title: const Text('Joselu124'),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset('./assets/icons/backbutton.svg'),
                ),
                bottom: TabBar(
                  padding: const EdgeInsets.all(globalSpacing),
                  controller: _tabController,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: '600 seguidores',
                    ),
                    Tab(
                      text: '40 seguidos',
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: ProfileDelegate(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(
                      globalSpacing,
                      0,
                      globalSpacing,
                      globalSpacing,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Buscar',
                              hintStyle: const TextStyle(
                                color: Color(0xff939393),
                                fontWeight: FontWeight.normal,
                              ),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              filled: true,
                              fillColor: const Color(0xFFF1F1F1),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(
                                    globalBorderRadius * 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(
                                    globalBorderRadius * 2),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            './assets/icons/search.svg',
                            color: const Color(0xFF939393),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(controller: _tabController, children: const [
            ProfileFollowers(),
            ProfileFollowings(),
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
}

class ProfileDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  ProfileDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => AppBar().preferredSize.height;

  @override
  double get minExtent => AppBar().preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
