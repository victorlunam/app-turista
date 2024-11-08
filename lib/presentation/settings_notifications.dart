import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/presentation/widgets/custom_radio.dart';
import 'package:flutter/material.dart';

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
  const SettingsNotificationsPage({super.key});

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
        leading: buildBackButton(context),
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
                      fontFamily: 'Proxima Soft',
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
              
        ],
      ),
    );
  }
}
