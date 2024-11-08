import 'package:flutter/material.dart';
import 'package:app_turista/presentation/widgets/bottom_navigation.dart';
import 'package:app_turista/presentation/widgets/moments.dart';
import 'package:app_turista/presentation/widgets/appbar_actions.dart';

List<Map<String, dynamic>> momentsList = [
  {
    "image": 'assets/images/moments/1.png',
    "username": "Joselu123",
    "userPhotoPath": "assets/images/users/user_1.png",
    "place": "Cuzco",
    "comments": 48,
    "likes": 270,
    "date": "02 Ene",
    "description": "En busca de nuevos rumbos",
  },
  {
    "image": 'assets/images/moments/2.png',
    "username": "Joselu123",
    "userPhotoPath": "assets/images/users/user_1.png",
    "place": "Mancora",
    "comments": 65,
    "likes": 340,
    "date": "04 Ene",
    "description": "Conociendo nuestro maravilloso Perú",
  },
  {
    "image": 'assets/images/moments/4.png',
    "username": "Joselu123",
    "userPhotoPath": "assets/images/users/user_1.png",
    "place": "Medellin",
    "comments": 98,
    "likes": 123,
    "date": "06 Ene",
    "description": "Ya tocaba una vuelta por Arequipa ♥️",
  },
];

class HomeMomentsPage extends StatelessWidget {
  const HomeMomentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Momentos'),
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        actions: buildActions(context),
        automaticallyImplyLeading: false,
      ),
      body: Moments(list: momentsList),
      bottomNavigationBar: const BottomNavigation(currentIndex: 1),
    );
  }
}
