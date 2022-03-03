import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('./assets/icons/backbutton.svg'),
        ),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text(
              'CUENTA',
              style: TextStyle(
                color: Color(0xFF9CA5B2),
              ),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset('./assets/icons/user.svg'),
            title: const Text('Datos de Cuenta'),
            onTap: () =>
                Navigator.pushNamed(context, '/profile/settings/accountData'),
          ),
          ListTile(
            leading: SvgPicture.asset('./assets/icons/card_user.svg'),
            title: const Text('Datos Personales'),
            onTap: () => Navigator.pushNamed(
                context, '/profile/settings/personalInformation'),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              'CONFIGURACIÓN',
              style: TextStyle(
                color: Color(0xFF9CA5B2),
              ),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset('./assets/icons/bell.svg'),
            title: const Text('Notificaciones'),
            onTap: () =>
                Navigator.pushNamed(context, '/settings/notifications'),
          ),
          const Divider(),
          const ListTile(
            title: Text(
              'AYUDA',
              style: TextStyle(
                color: Color(0xFF9CA5B2),
              ),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset('./assets/icons/clock.svg'),
            title: const Text('Preguntas Frecuentes'),
            onTap: () =>
                Navigator.pushNamed(context, '/settings/frequentQuestions'),
          ),
          ListTile(
            leading: SvgPicture.asset('./assets/icons/book_open.svg'),
            title: const Text('Acerca De'),
            onTap: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
    );
  }
}
