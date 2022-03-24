import 'package:appturista/models/user.dart';
import 'package:appturista/presentation/widgets/appbar_backbutton.dart';
import 'package:appturista/presentation/widgets/bottom_navigation.dart';
import 'package:appturista/presentation/widgets/custom_textfield.dart';
import 'package:appturista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

int countNotification = 2;

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final usernameController = TextEditingController();
  final fullnameController = TextEditingController();
  final biographyController = TextEditingController();

  late final List<Widget> actions = [
    IconButton(
      onPressed: () {},
      icon: SvgPicture.asset(
        'assets/icons/bars.svg',
        height: globalSizeIcon,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar perfil'),
        centerTitle: true,
        leading: buildBackButton(context),
        actions: actions,
      ),
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: globalSpacing * 2),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.user.photo),
                    radius: MediaQuery.of(context).size.width * 0.15,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Cambiar foto de perfil',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  CustomTextField(
                    controller: usernameController,
                    label: 'Usuario',
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: fullnameController,
                    label: 'Nombres y Apellidos',
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: biographyController,
                    label: 'Biografía',
                    minLines: 1,
                    maxLines: 3,
                    inputContentPadding: EdgeInsets.zero,
                    maxLength: 90,
                    counterText: '90 caracteres',
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                  ),
                  const Divider(
                    color: Color(0xFF939393),
                    thickness: 1,
                    height: 5,
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Actualizar',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF1B8F26),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
      bottomNavigationBar: const BottomNavigation(currentIndex: 0),
    );
  }
}
