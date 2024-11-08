import 'package:app_turista/models/user.dart';
import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/presentation/widgets/bottom_navigation.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_svg/svg.dart';

int countNotification = 2;

List<Map<String, dynamic>> messages = [
  {
    'username': 'Adolfo123',
    'photo': 'assets/images/users/user_1.png',
    'date': 'Enviado hace una hora',
    'numberUnreadMesssages': 2,
    'unreadMessages': true,
    'fullname': 'Adolfo Aguilar',
    'biography': '',
  },
  {
    'username': 'Lina',
    'photo': 'assets/images/users/user_2.png',
    'date': 'Enviado hace 5 min',
    'numberUnreadMesssages': 0,
    'unreadMessages': false,
    'fullname': 'Lina Linarez',
    'biography': '',
  },
  {
    'username': 'Sebastians2',
    'photo': 'assets/images/users/user_3.png',
    'date': 'Activo el 24Dic',
    'numberUnreadMesssages': 2,
    'unreadMessages': true,
    'fullname': 'Sebastian Yatra',
    'biography': '',
  },
];

class HomeMessagesPage extends StatefulWidget {
  const HomeMessagesPage({super.key});

  @override
  State<HomeMessagesPage> createState() => _HomeMessagesPageState();
}

class _HomeMessagesPageState extends State<HomeMessagesPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              toolbarHeight: AppBar().preferredSize.height + globalSpacing * 2,
              title: const Text('joselu123'),
              centerTitle: true,
              leading: buildBackButton(context),
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
                    text: 'Todo',
                  ),
                  Tab(
                    text: 'Solicitudes',
                  ),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: MessageDelegate(
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
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.circular(globalBorderRadius * 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.circular(globalBorderRadius * 2),
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
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildChats(messages),
            _buildChats(messages),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(currentIndex: 4),
    );
  }
}

class MessageDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  MessageDelegate({required this.child});

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

Widget _buildChats(List<Map<String, dynamic>> list) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      return ListTile(
        onTap: () => Navigator.pushNamed(
          context,
          '/chat',
          arguments: User(
            username: list[index]['username'],
            fullname: list[index]['fullname'],
            biography: list[index]['biography'],
            photo: list[index]['photo'],
          ),
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage(list[index]['photo']),
        ),
        title: Text(list[index]['username']),
        subtitle: Text(list[index]['date']),
        trailing: list[index]['unreadMessages']
            ? Badge(
                badgeContent: Text(
                  list[index]['numberUnreadMesssages'].toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              )
            : null,
      );
    },
  );
}
