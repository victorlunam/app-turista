import 'package:appturista/components/moments.dart';
import 'package:appturista/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart';
import 'package:appturista/components/section.dart';

int countNotification = 2;

List<Map<String, dynamic>> momentsList = [
  {
    "image": './assets/images/moments/1.png',
    "username": "Joselu123",
    "userPhotoPath": "./assets/images/users/user_1.png",
    "place": "Cuzco",
    "comments": 48,
    "likes": 270,
    "date": "02 Ene",
    "description": "En busca de nuevos rumbos",
  },
  {
    "image": './assets/images/moments/2.png',
    "username": "Joselu123",
    "userPhotoPath": "./assets/images/users/user_1.png",
    "place": "Mancora",
    "comments": 65,
    "likes": 340,
    "date": "04 Ene",
    "description": "Conociendo nuestro maravilloso Perú",
  },
  {
    "image": './assets/images/moments/4.png',
    "username": "Joselu123",
    "userPhotoPath": "./assets/images/users/user_1.png",
    "place": "Medellin",
    "comments": 98,
    "likes": 123,
    "date": "06 Ene",
    "description": "Ya tocaba una vuelta por Arequipa ♥️",
  },
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key, this.indexBottom = 0}) : super(key: key);

  final int indexBottom;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndexBottomNavigation = widget.indexBottom;
  final bool _visibilityBadge = false;

  late final List<Widget> _pages = [home(), moments()];
  late final List<Widget> _titleAppbar = [
    Image.asset(
      './assets/images/logo.png',
      height: MediaQuery.of(context).size.height * 0.1,
    ),
    const Text('Momentos'),
  ];

  late final List<Widget> actions = [
    IconButton(
      onPressed: () => Navigator.pushNamed(context, '/notifications'),
      icon: Badge(
        badgeContent: Text(
          countNotification.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
          textAlign: TextAlign.center,
        ),
        showBadge: _visibilityBadge,
        child: SvgPicture.asset('./assets/icons/bell.svg'),
      ),
    ),
    IconButton(
      onPressed: () => Navigator.pushNamed(context, '/search'),
      icon: SvgPicture.asset('./assets/icons/search.svg'),
    ),
    IconButton(
      onPressed: () => Navigator.pushNamed(
        context,
        '/profile',
        arguments: ProfilePageArguments(isOwner: true),
      ),
      icon: SvgPicture.asset('./assets/icons/user.svg'),
    ),
  ];

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

  _handleChangeViewBottomNavigation(int index) {
    if (index == 2) {
      Navigator.pushNamed(context, '/camera');
    } else {
      setState(() {
        _selectedIndexBottomNavigation = index;
      });
    }
  }

  Widget _handleAppBarTitle(int index) => _titleAppbar.elementAt(index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _handleAppBarTitle(_selectedIndexBottomNavigation),
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        actions: actions,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: _pages.elementAt(_selectedIndexBottomNavigation),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomNavigation,
        elevation: 0,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndexBottomNavigation,
        onTap: _handleChangeViewBottomNavigation,
      ),
    );
  }

  Widget home() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          OffersSection(),
          SectionTitle(
            pathIcon: './assets/icons/section_pin.svg',
            title: 'Destinos del momento',
            subTitle: '125 lugares',
          ),
          DestinationsSection(),
          SectionTitle(
            pathIcon: './assets/icons/section_hashtag.svg',
            title: 'Momentos de Amigos',
            subTitle: '36 populares',
          ),
          MomentsSection(),
        ],
      ),
    );
  }

  Widget moments() => Moments(list: momentsList);
}
