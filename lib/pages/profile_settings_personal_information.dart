import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileSettingsPersonalInformation extends StatefulWidget {
  const ProfileSettingsPersonalInformation({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsPersonalInformation> createState() =>
      _ProfileSettingsPersonalInformationState();
}

class _ProfileSettingsPersonalInformationState
    extends State<ProfileSettingsPersonalInformation> {
  final numberPhoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Personales'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('./assets/icons/backbutton.svg'),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: const [
          ListTile(
            title: Text(
              'Sexo',
              style: TextStyle(
                color: Color(0xFF939393),
              ),
            ),
            subtitle: Text(
              'Masculino',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Nacimiento',
              style: TextStyle(
                color: Color(0xFF939393),
              ),
            ),
            subtitle: Text(
              '24/05/1993',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Documento de Identidad',
              style: TextStyle(
                color: Color(0xFF939393),
              ),
            ),
            subtitle: Text(
              '33256589',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
