import 'package:appturista/utils/global_variables.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

int countNotification = 2;

List<String> followings = [
  'assets/images/reels/1.png',
  'assets/images/reels/2.png',
  'assets/images/reels/3.png',
  'assets/images/reels/4.png',
  'assets/images/reels/1.png',
  'assets/images/reels/2.png',
  'assets/images/reels/3.png',
  'assets/images/reels/4.png',
];

List<String> friends = [
  'assets/images/reels/3.png',
  'assets/images/reels/2.png',
  'assets/images/reels/3.png',
  'assets/images/reels/2.png',
  'assets/images/reels/4.png',
  'assets/images/reels/1.png',
  'assets/images/reels/4.png',
  'assets/images/reels/1.png',
];

class HomeReelsPage extends StatefulWidget {
  const HomeReelsPage({Key? key}) : super(key: key);

  @override
  State<HomeReelsPage> createState() => _HomeReelsPageState();
}

class _HomeReelsPageState extends State<HomeReelsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppBar().preferredSize.height + globalSpacing * 2,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('assets/icons/backbutton.svg'),
        ),
        title: const Text('Reels'),
        centerTitle: true,
        bottom: TabBar(
          padding: const EdgeInsets.all(globalSpacing),
          controller: _tabController,
          indicatorColor: Colors.black,
          unselectedLabelColor: const Color(0xFF939393),
          labelColor: Colors.black,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          tabs: const [
            Tab(
              text: 'Siguiendo',
            ),
            Tab(
              text: 'Amigos',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _builderReels(context, followings),
          _builderReels(context, friends),
        ],
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

Widget _builderReels(BuildContext context, List list) {
  return GridView.builder(
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisSpacing: globalSpacing / 5,
      crossAxisSpacing: globalSpacing / 5,
      crossAxisCount: 2,
      childAspectRatio: 9 / 16,
    ),
    itemCount: list.length,
    itemBuilder: (BuildContext ctx, index) {
      return GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/profile/view/reels'),
        child: Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(list[index]),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(globalSpacing / 2),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/play_triangle.svg',
                  color: Colors.white,
                ),
                const Text(
                  '152',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
