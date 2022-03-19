import 'dart:io';

import 'package:appturista/models/user.dart';
import 'package:appturista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CameraPageViewArguments {
  final User? user;
  final String path;

  const CameraPageViewArguments(
    this.path, {
    this.user,
  });
}

class CameraViewPage extends StatelessWidget {
  const CameraViewPage({Key? key, required this.path, this.user})
      : super(key: key);

  final User? user;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset(
                  'assets/icons/close.svg',
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: globalSpacing,
              bottom: globalSpacing,
              child: SizedBox(
                height: 40,
                width: 120,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/moment/create',
                    arguments: path,
                  ),
                  child: user == null
                      ? const Text(
                          'Siguiente',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        )
                      : Row(
                          children: const [
                            CircleAvatar(
                              maxRadius: 15,
                              backgroundImage: AssetImage(
                                'assets/images/users/user_1.png',
                              ),
                            ),
                            SizedBox(width: globalSpacing),
                            Text(
                              'Enviar',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
