import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<String> itemsMoments = [
  'assets/images/moments/1.png',
  'assets/images/moments/2.png',
  'assets/images/moments/3.png',
  'assets/images/moments/4.png',
  'assets/images/moments/5.png',
  'assets/images/moments/6.png',
  'assets/images/moments/7.png',
  'assets/images/moments/8.png',
  'assets/images/moments/9.png',
  'assets/images/moments/1.png',
  'assets/images/moments/2.png',
  'assets/images/moments/3.png',
  'assets/images/moments/4.png',
  'assets/images/moments/5.png',
  'assets/images/moments/6.png',
  'assets/images/moments/7.png',
  'assets/images/moments/8.png',
  'assets/images/moments/9.png',
];

List<String> itemsReels = [
  'assets/images/reels/1.png',
  'assets/images/reels/2.png',
  'assets/images/reels/3.png',
  'assets/images/reels/4.png',
  'assets/images/reels/1.png',
  'assets/images/reels/2.png',
  'assets/images/reels/3.png',
  'assets/images/reels/4.png',
];

class SearchViewPage extends StatefulWidget {
  const SearchViewPage({super.key, required this.title});

  final String title;

  @override
  State<SearchViewPage> createState() => _SearchViewPageState();
}

class _SearchViewPageState extends State<SearchViewPage>
    with SingleTickerProviderStateMixin {
  int _indexTabBar = 0;
  late final _tabController = TabController(length: 2, vsync: this);

  Widget buildResults(
    BuildContext context,
    List<String> list, {
    int columns = 3,
    double? aspectRatio,
  }) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: globalSpacing / 5,
        crossAxisSpacing: globalSpacing / 5,
        crossAxisCount: columns,
        childAspectRatio: aspectRatio ?? 1,
      ),
      itemCount: list.length,
      itemBuilder: (BuildContext ctx, index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/profile/view/moments'),
          child: Container(
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(list[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: _indexTabBar == 1
                ? Padding(
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
                  )
                : null,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        leading: buildBackButton(context),
        bottom: TabBar(
          padding: const EdgeInsets.fromLTRB(
              globalSpacing, 0, globalSpacing, globalSpacing),
          controller: _tabController,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          onTap: (index) => setState(() {
            _indexTabBar = index;
          }),
          tabs: [
            Tab(
              icon: SvgPicture.asset(
                'assets/icons/moments.svg',
                height: globalSizeIcon,
                color:
                    _indexTabBar != 0 ? const Color(0xFF939393) : Colors.black,
              ),
            ),
            Tab(
              icon: SvgPicture.asset(
                'assets/icons/play.svg',
                height: globalSizeIcon,
                color:
                    _indexTabBar != 1 ? const Color(0xFF939393) : Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildResults(context, itemsMoments),
          buildResults(
            context,
            itemsReels,
            aspectRatio: 9 / 16,
            columns: 2,
          )
        ],
      ),
    );
  }
}
