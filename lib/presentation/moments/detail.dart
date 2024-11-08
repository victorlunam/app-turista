import 'package:app_turista/presentation/profile/widgets/profile_moments.dart';
import 'package:app_turista/presentation/profile/widgets/profile_reels.dart';
import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/presentation/widgets/bottom_navigation.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

int countNotification = 2;

class MomentsDetailPage extends StatefulWidget {
  const MomentsDetailPage({super.key});

  @override
  State<MomentsDetailPage> createState() => _MomentsDetailPageState();
}

class _MomentsDetailPageState extends State<MomentsDetailPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);
  int _indexTabBar = 0;

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
  ];

  late final tabBarViews = const [ProfileMoments(), ProfileReels()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildBackButton(context),
        title: const Text('Destinos del Momento'),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: false,
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                collapsedHeight: 350,
                expandedHeight: 350,
                automaticallyImplyLeading: false,
                flexibleSpace: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 5 / 3,
                      child: Image(
                        image: AssetImage('assets/images/machu_picchu.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(height: globalSpacing),
                    Text(
                      'Machupichu',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: globalSpacing),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: globalSpacing),
                      child: Text(
                        'Machupicchu, la séptima maravilla del mundo se ubica en Cuzco y esta esperando por tu visita.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: globalSpacing),
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: MomentDelegate(
                  TabBar(
                    padding: const EdgeInsets.all(globalSpacing),
                    controller: _tabController,
                    indicatorColor: Colors.black,
                    onTap: (index) => setState(() {
                      _indexTabBar = index;
                    }),
                    tabs: tabBarTabs,
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: tabBarViews,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),
    );
  }
}

class MomentDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  MomentDelegate(this.tabBar);

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
