import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
        centerTitle: true,
        leading: buildBackButton(context),
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
            leading: SvgPicture.asset(
              'assets/icons/user.svg',
              height: globalSizeIcon,
            ),
            title: const Text('Datos de Cuenta'),
            onTap: () =>
                Navigator.pushNamed(context, '/profile/settings/accountData'),
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/card_user.svg',
              height: globalSizeIcon,
            ),
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
            leading: SvgPicture.asset(
              'assets/icons/bell.svg',
              height: globalSizeIcon,
            ),
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
            leading: SvgPicture.asset(
              'assets/icons/clock.svg',
              height: globalSizeIcon,
            ),
            title: const Text('Preguntas Frecuentes'),
            onTap: () =>
                Navigator.pushNamed(context, '/settings/frequentQuestions'),
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/book_open.svg',
              height: globalSizeIcon,
            ),
            title: const Text('Acerca De'),
            onTap: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
    );
  }
}
