import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MomentVisibilityPage extends StatefulWidget {
  const MomentVisibilityPage({super.key});

  @override
  State<MomentVisibilityPage> createState() => _MomentVisibilityPageState();
}

class _MomentVisibilityPageState extends State<MomentVisibilityPage> {
  bool sharedPublic = false;
  bool sharedFriends = false;
  bool sharedOwner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildBackButton(context),
        title: const Text('Mostrar A'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF939393),
              radius: 21,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  'assets/icons/globe.svg',
                  color: Colors.black,
                  height: globalSizeIcon,
                ),
              ),
            ),
            title: const Text('Público'),
            trailing: Switch(
              value: sharedPublic,
              onChanged: (value) => setState(() {
                sharedPublic = value;
              }),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF939393),
              radius: 21,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  'assets/icons/users.svg',
                  color: Colors.black,
                  height: globalSizeIcon,
                ),
              ),
            ),
            title: const Text('Amigos'),
            trailing: Switch(
              value: sharedFriends,
              onChanged: (value) => setState(() {
                sharedFriends = value;
              }),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF939393),
              radius: 21,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  'assets/icons/look.svg',
                  color: Colors.black,
                  height: globalSizeIcon,
                ),
              ),
            ),
            title: const Text('Solo yo'),
            trailing: Switch(
              value: sharedOwner,
              onChanged: (value) => setState(() {
                sharedOwner = value;
              }),
            ),
          ),
        ],
      ),
    );
  }
}
