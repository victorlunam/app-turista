import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/presentation/widgets/appbar_textfield.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Map<String, dynamic>> searchAll = [
  {
    "leading": "assets/images/users/user_1.png",
    "title": "Jose Perez Ruiz",
    "type": "user"
  },
  {
    "leading": "assets/images/users/user_2.png",
    "title": "Daphne Lujan",
    "type": "user"
  },
  {
    "leading": "assets/icons/pin_map.svg",
    "title": "Restaurantes trujillo",
    "type": "location"
  },
  {
    "leading": "assets/icons/hash.svg",
    "title": "#aventuraviajero",
    "type": "hashtag"
  }
];

List<Map<String, dynamic>> searchPeople = [
  {
    "leading": "assets/images/users/user_1.png",
    "title": "Jose Perez Ruiz",
    "type": "user"
  },
  {
    "leading": "assets/images/users/user_2.png",
    "title": "Daphne Lujan",
    "type": "user"
  },
  {
    "leading": "assets/images/users/user_3.png",
    "title": "Pedro Lujan",
    "type": "user"
  },
];

List<Map<String, dynamic>> searchLocation = [
  {
    "leading": "assets/icons/pin_map.svg",
    "title": "Restaurantes trujillo",
    "type": "location"
  },
  {
    "leading": "assets/icons/pin_map.svg",
    "title": "Bar trujillo",
    "type": "location"
  },
  {
    "leading": "assets/icons/pin_map.svg",
    "title": "Plaza de trujillo",
    "type": "location"
  },
];

List<Map<String, dynamic>> searchHashTag = [
  {
    "leading": "assets/icons/hash.svg",
    "title": "#aventuraviajero",
    "type": "hashtag"
  },
  {
    "leading": "assets/icons/hash.svg",
    "title": "#nuevaaventura",
    "type": "hashtag"
  },
  {"leading": "assets/icons/hash.svg", "title": "#trujillo", "type": "hashtag"}
];

List options = [
  searchAll,
  searchPeople,
  searchLocation,
  searchHashTag,
];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  String query = '';
  late FocusNode focus;
  bool _hasFocus = false;
  int _indexTabBar = 0;
  late final _tabController = TabController(length: 4, vsync: this);

  @override
  void initState() {
    super.initState();
    focus = FocusNode();
    focus.addListener(() {
      setState(() {
        _hasFocus = focus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  late final List<Widget> actions = [
    IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'assets/icons/search.svg',
        color: const Color(0xFF707070),
        height: globalSizeIcon,
      ),
    ),
  ];

  PreferredSizeWidget recentSearch() {
    return PreferredSize(
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: globalSpacing * 2),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Color(0xFFE4E4E4),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Búsquedas recientes',
              style: TextStyle(fontSize: 16),
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text(
                'Borrar todo',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget tabs() {
    return TabBar(
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
            'assets/icons/search.svg',
            height: globalSizeIcon,
            color: _indexTabBar != 0 ? const Color(0xFF939393) : Colors.black,
          ),
        ),
        Tab(
          icon: SvgPicture.asset(
            'assets/icons/user.svg',
            height: globalSizeIcon,
            color: _indexTabBar != 1 ? const Color(0xFF939393) : Colors.black,
          ),
        ),
        Tab(
          icon: SvgPicture.asset(
            'assets/icons/pin_map.svg',
            height: globalSizeIcon,
            color: _indexTabBar != 2 ? const Color(0xFF939393) : Colors.black,
          ),
        ),
        Tab(
          icon: SvgPicture.asset(
            'assets/icons/hash.svg',
            height: globalSizeIcon,
            color: _indexTabBar != 4 ? const Color(0xFF939393) : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget buildResults(BuildContext context, List<Map<String, dynamic>> list,
      {Widget? trailing, bool hideTrailing = false}) {
    Widget trailing0 = trailing ??
        SvgPicture.asset(
          'assets/icons/xmark.svg',
          color: const Color(0xFF707070),
          height: globalSizeIconSmall,
        );

    List<Map<String, dynamic>> matchQuery = [];
    for (var i in list) {
      if (i['title'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(i);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result['title']),
          onTap: result['type'] == "user"
              ? () {}
              : () => Navigator.pushNamed(context, '/search/view',
                  arguments: result['title']),
          leading: result['type'] == "user"
              ? CircleAvatar(
                  backgroundImage: AssetImage(result['leading']),
                )
              : CircleAvatar(
                  backgroundColor: const Color(0xFF939393),
                  radius: 21,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      'assets/icons/pin_map.svg',
                      color: Colors.black,
                      height: globalSizeIcon,
                    ),
                  ),
                ),
          trailing: hideTrailing ? null : trailing0,
        );
      },
    );
  }

  _handleChange(value) {
    setState(() {
      query = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double heightAppbar = AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        leading: buildBackButton(context),
        title: AppBarTextField(
          focusNode: focus,
          onChanged: _handleChange,
        ),
        actions: actions,
        bottom: _hasFocus ? tabs() : recentSearch(),
        toolbarHeight: _hasFocus ? heightAppbar + globalSpacing : heightAppbar,
        titleSpacing: 0,
      ),
      body: _hasFocus
          ? TabBarView(
              controller: _tabController,
              children: [
                buildResults(context, searchAll),
                buildResults(context, searchPeople, hideTrailing: true),
                buildResults(
                  context,
                  searchLocation,
                  trailing: const Text(
                    '50 momentos',
                    style: TextStyle(
                      color: Color(0xFF939393),
                    ),
                  ),
                ),
                buildResults(
                  context,
                  searchHashTag,
                  trailing: const Text(
                    '50 momentos',
                    style: TextStyle(
                      color: Color(0xFF939393),
                    ),
                  ),
                ),
              ],
            )
          : buildResults(context, searchAll),
    );
  }
}
