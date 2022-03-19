import 'package:appturista/presentation/profile/widgets/profile_moments.dart';
import 'package:appturista/presentation/profile/widgets/profile_reels.dart';
import 'package:appturista/utils/global_variables.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

int countNotification = 2;

class MomentsDetailPage extends StatefulWidget {
  const MomentsDetailPage({Key? key}) : super(key: key);

  @override
  State<MomentsDetailPage> createState() => _MomentsDetailPageState();
}

class _MomentsDetailPageState extends State<MomentsDetailPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);
  int _indexTabBar = 0;

  List<BottomNavigationBarItem> bottomNavigation = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/home.svg'),
      label: 'Inicio',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/moments.svg'),
      label: 'Momentos',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/create.svg'),
      label: 'Crear',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset('assets/icons/reels.svg'),
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
        child: SvgPicture.asset('assets/icons/messages.svg'),
      ),
      label: 'Mensajes',
    ),
  ];

  late final tabBarTabs = [
    Tab(
      icon: SvgPicture.asset(
        'assets/icons/grid.svg',
        color: _indexTabBar != 0 ? const Color(0xFF939393) : Colors.black,
      ),
    ),
    Tab(
      icon: SvgPicture.asset(
        'assets/icons/play.svg',
        color: _indexTabBar != 1 ? const Color(0xFF939393) : Colors.black,
      ),
    ),
  ];

  late final tabBarViews = const [ProfileMoments(), ProfileReels()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('assets/icons/backbutton.svg'),
        ),
        title: const Text('Destinos del Momento'),
        centerTitle: true,
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
                  children: const [
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
