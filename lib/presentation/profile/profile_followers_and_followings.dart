import 'package:app_turista/presentation/profile/widgets/profile_followers.dart';
import 'package:app_turista/presentation/profile/widgets/profile_followings.dart';
import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/presentation/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app_turista/utils/global_variables.dart';

int countNotification = 2;

class ProfileFollowersAndFollowingsPage extends StatefulWidget {
  const ProfileFollowersAndFollowingsPage({super.key, required this.indexTab});

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
                leading: buildBackButton(context),
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
                            'assets/icons/search.svg',
                            color: const Color(0xFF939393),
                            height: globalSizeIcon,
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
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),
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
