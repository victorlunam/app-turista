import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:flutter/material.dart';

List<Map<String, String>> preferences = [
  {'path': 'assets/icons/food.png', 'name': 'Comida', 'value': 'food'},
  {'path': 'assets/icons/tourism.png', 'name': 'Turismo', 'value': 'tourism'},
];

class ProfileSettingsAccountData extends StatefulWidget {
  const ProfileSettingsAccountData({super.key});

  @override
  State<ProfileSettingsAccountData> createState() =>
      _ProfileSettingsAccountDataState();
}

class _ProfileSettingsAccountDataState
    extends State<ProfileSettingsAccountData> {
  final numberPhoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos de Cuenta'),
        centerTitle: true,
        leading: buildBackButton(context),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const ListTile(
            title: Text(
              'Número de Celular',
              style: TextStyle(
                color: Color(0xFF939393),
              ),
            ),
            subtitle: Text(
              '+51 987 654 321',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              'Correo Electrónico',
              style: TextStyle(
                color: Color(0xFF939393),
              ),
            ),
            subtitle: Text(
              'ejemplo@gmail.com',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              'Contraseña',
              style: TextStyle(
                color: Color(0xFF939393),
              ),
            ),
            subtitle: Text(
              '******************',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Categorías de Interes',
              style: TextStyle(
                color: Color(0xFF222423),
              ),
            ),
            subtitle: Wrap(
              spacing: 5,
              children: preferences
                  .map((e) => Chip(
                        side: const BorderSide(color: Colors.white, width: 2),
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
          ),
        ],
      ),
    );
  }
}
