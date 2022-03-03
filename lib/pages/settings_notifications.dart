import 'package:appturista/components/custom_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Map<String, dynamic>> options = [
  {
    "value": 1,
    "label": "Seguidor nuevo",
    "selected": true,
  },
  {
    "value": 2,
    "label": "Quien comento mi momento",
    "selected": false,
  },
  {
    "value": 3,
    "label": "A quien le gusto mi momento",
    "selected": true,
  },
  {
    "value": 4,
    "label": "Quien compartio mi momento",
    "selected": true,
  },
  {
    "value": 5,
    "label": "Quien me mencionó en un comentario",
    "selected": true,
  },
  {
    "value": 6,
    "label": "A quien le gusto mi comentario",
    "selected": false,
  },
];

class SettingsNotificationsPage extends StatefulWidget {
  const SettingsNotificationsPage({Key? key}) : super(key: key);

  @override
  State<SettingsNotificationsPage> createState() =>
      _SettingsNotificationsPageState();
}

class _SettingsNotificationsPageState extends State<SettingsNotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
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
              'Deseo recibir notificationes de:',
              style: TextStyle(color: Color(0xFF707070)),
            ),
          ),
          ...options
              .map(
                (option) => ListTile(
                  title: Text(
                    option['label'],
                    style: const TextStyle(
                      color: Color(0xFF939393),
                      fontSize: 16,
                    ),
                  ),
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: CustomRadio(
                    selected: option['selected'] ?? false,
                    size: 25,
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
