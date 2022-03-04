import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart';
import 'package:appturista/components/section.dart';

int countNotification = 2;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool _visibilityBadge = false;

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
      onPressed: () => Navigator.pushNamed(context, '/profile'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          './assets/images/logo.png',
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        actions: actions,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
