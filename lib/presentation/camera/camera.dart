import 'package:appturista/models/user.dart';
import 'package:appturista/presentation/camera/camera_view.dart';
import 'package:appturista/utils/global_variables.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

late List<CameraDescription> cameras;

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  late CameraLensDirection _cameraDirection;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(
      cameras.first,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    _cameraDirection = cameras.first.lensDirection;
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void takePhoto(BuildContext context) async {
    XFile file = await _cameraController.takePicture();
    Navigator.pushNamed(
      context,
      '/camera/view',
      arguments: CameraPageViewArguments(file.path, user: widget.user),
    );
  }

  CameraLensDirection _toogleDirection() {
    if (_cameraDirection == CameraLensDirection.back) {
      return CameraLensDirection.front;
    }
    return CameraLensDirection.back;
  }

  void toogleCamera() {
    CameraDescription newDescription = cameras.firstWhere(
      (camera) => camera.lensDirection == _toogleDirection(),
    );

    CameraController newController = CameraController(
      newDescription,
      ResolutionPreset.high,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    setState(() {
      _cameraController = newController;
      _cameraDirection = newDescription.lensDirection;
      cameraValue = newController.initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: CameraPreview(_cameraController),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
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
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(globalSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => toogleCamera(),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/rotate.svg',
                            color: Colors.white,
                          ),
                          const SizedBox(height: globalSpacing / 2),
                          const Text(
                            'Girar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => takePhoto(context),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            margin: const EdgeInsets.only(
                                bottom: globalSpacing / 2),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(200, 255, 255, 255),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Text(
                            'Grabar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/picker'),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/picture.svg',
                            color: Colors.white,
                          ),
                          const SizedBox(height: globalSpacing / 2),
                          const Text(
                            'Cargar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
