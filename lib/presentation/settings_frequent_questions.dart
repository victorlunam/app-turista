import 'package:appturista/presentation/widgets/appbar_backbutton.dart';
import 'package:appturista/utils/global_variables.dart';
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
        leading: buildBackButton(context),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/alert.svg',
              height: globalSizeIcon,
            ),
            title: const Text(
              'Uso de la App',
              style: TextStyle(color: Color(0xFF939393)),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/user.svg',
              height: globalSizeIcon,
            ),
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
