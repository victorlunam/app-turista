import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingsFrequentQuestionsPage extends StatelessWidget {
  const SettingsFrequentQuestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preguntas frecuentes'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('assets/icons/backbutton.svg'),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: SvgPicture.asset('assets/icons/alert.svg'),
            title: const Text(
              'Uso de la App',
              style: TextStyle(color: Color(0xFF939393)),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset('assets/icons/user.svg'),
            title: const Text(
              'Mi perfil',
              style: TextStyle(color: Color(0xFF939393)),
            ),
          ),
        ],
      ),
    );
  }
}
