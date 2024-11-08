import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Map<String, String>> preferences = [
  {'path': 'assets/icons/food.png', 'name': 'Comida', 'value': 'food'},
  {'path': 'assets/icons/tourism.png', 'name': 'Turismo', 'value': 'tourism'},
  {
    'path': 'assets/icons/entertainment.png',
    'name': 'Entretenimiento',
    'value': 'entertainment'
  },
  {'path': 'assets/icons/travel.png', 'name': 'Viajes', 'value': 'travel'},
  {'path': 'assets/icons/music.png', 'name': 'Música', 'value': 'music'},
  {'path': 'assets/icons/fitness.png', 'name': 'Fitness', 'value': 'fitness'},
  {'path': 'assets/icons/books.png', 'name': 'Libros', 'value': 'books'},
  {'path': 'assets/icons/animals.png', 'name': 'Animales', 'value': 'animals'},
  {'path': 'assets/icons/pets.png', 'name': 'Mascotas', 'value': 'pets'},
  {'path': 'assets/icons/tours.png', 'name': 'Tours', 'value': 'tours'},
  {'path': 'assets/icons/sport.png', 'name': 'Deporte', 'value': 'sport'},
  {'path': 'assets/icons/tourism.png', 'name': 'Naturaleza', 'value': 'nature'},
  {'path': 'assets/icons/family.png', 'name': 'Familia', 'value': 'family'},
];

class SignUpPreferencesPage extends StatefulWidget {
  const SignUpPreferencesPage({super.key});

  @override
  State<SignUpPreferencesPage> createState() => _SignUpPreferencesPageState();
}

class _SignUpPreferencesPageState extends State<SignUpPreferencesPage> {
  final List<String> selectedChips = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              '/home',
              arguments: 0,
            ),
            icon: SvgPicture.asset(
              'assets/icons/close.svg',
              height: globalSizeIcon,
            ),
          ),
        ],
        title: const Text(
          'Elige tus preferencias',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.top,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Wrap(
              spacing: 5,
              children: preferences
                  .map((e) => ChoiceChip(
                        side: BorderSide(
                            color: selectedChips.contains(e['value'])
                                ? const Color(0xFF1B8F26)
                                : Colors.white,
                            width: 2),
                        selected: selectedChips.contains(e['value']),
                        selectedColor: Colors.white,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              selectedChips.add(e['value'] ?? '');
                            } else {
                              selectedChips.remove(e['value']);
                            }
                          });
                        },
                        avatar: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(e['path'] ?? ''),
                        ),
                        label: Text(e['name'] ?? ''),
                        backgroundColor: Colors.white,
                        elevation: 2,
                      ))
                  .toList(),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B8F26),
                ),
                child: const Text(
                  'Siguiente',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
