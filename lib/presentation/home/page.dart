import 'package:flutter/material.dart';
import 'package:app_turista/presentation/widgets/appbar_actions.dart';
import 'package:app_turista/presentation/widgets/bottom_navigation.dart';
import 'package:app_turista/presentation/home/widgets/section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        actions: buildActions(context),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: home(),
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),
    );
  }

  Widget home() {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OffersSection(),
          SectionTitle(
            pathIcon: 'assets/icons/section_pin.svg',
            title: 'Destinos del momento',
            subTitle: '125 lugares',
          ),
          DestinationsSection(),
          SectionTitle(
            pathIcon: 'assets/icons/section_hashtag.svg',
            title: 'Momentos de Amigos',
            subTitle: '36 populares',
          ),
          MomentsSection(),
        ],
      ),
    );
  }
}
