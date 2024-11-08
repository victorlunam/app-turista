import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/presentation/widgets/bottom_navigation.dart';
import 'package:app_turista/utils/global_variables.dart';
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
  const HomeReelsPage({super.key});

  @override
  State<HomeReelsPage> createState() => _HomeReelsPageState();
}

class _HomeReelsPageState extends State<HomeReelsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppBar().preferredSize.height + globalSpacing * 2,
        leading: buildBackButton(context),
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
      bottomNavigationBar: const BottomNavigation(currentIndex: 3),
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
                  height: globalSizeIcon,
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
