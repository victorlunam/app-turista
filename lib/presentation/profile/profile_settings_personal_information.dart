import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:flutter/material.dart';

class ProfileSettingsPersonalInformation extends StatefulWidget {
  const ProfileSettingsPersonalInformation({super.key});

  @override
  State<ProfileSettingsPersonalInformation> createState() =>
      _ProfileSettingsPersonalInformationState();
}

class _ProfileSettingsPersonalInformationState
    extends State<ProfileSettingsPersonalInformation> {
  final numberPhoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  int isOlder = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Personales'),
        centerTitle: true,
        leading: buildBackButton(context),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const ListTile(
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
          const Divider(),
          const ListTile(
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
          const Divider(),
          const ListTile(
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
          const Divider(),
          RadioListTile(
            toggleable: true,
            value: 1,
            groupValue: isOlder,
            onChanged: (int? value) {
              setState(() {
                if (value == 1) {
                  isOlder = value!;
                } else {
                  isOlder = 0;
                }
              });
            },
            title: const Text(
              'Soy mayor de 18 años',
              style: TextStyle(
                color: Color(0xFF939393),
              ),
            ),
          )
        ],
      ),
    );
  }
}
