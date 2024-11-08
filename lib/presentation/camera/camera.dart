import 'dart:math' as math;
// import 'dart:io';
import 'package:app_turista/models/user.dart';
import 'package:app_turista/presentation/camera/camera_view.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:image_cropper/image_cropper.dart';

late List<CameraDescription> cameras;

class CameraPage extends StatefulWidget {
  const CameraPage({super.key, this.user});

  final User? user;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage>
    with SingleTickerProviderStateMixin {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  late CameraLensDirection _cameraDirection;
  late final _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
  );
  bool isRecord = false;

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
    /* File? imageCropped = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio: const CropAspectRatio(
        ratioX: 1,
        ratioY: 1,
      ),
      androidUiSettings: const AndroidUiSettings(
        toolbarTitle: 'Editar Foto',
        statusBarColor: Colors.black,
      ),
    );
    if (imageCropped != null) {
      Navigator.pushNamed(
        context,
        '/camera/view',
        arguments: CameraPageViewArguments(
          imageCropped.path,
          user: widget.user,
        ),
      );
    } */
    Navigator.pushNamed(
      context,
      '/camera/view',
      arguments: CameraPageViewArguments(
        file.path,
        user: widget.user,
      ),
    );
  }

  void startRecord() async {
    await _cameraController.startVideoRecording();
  }

  void stopRecord() async {
    await _cameraController.stopVideoRecording().then((file) {
      print('Se grabo el video en ${file.path}');
      Navigator.pushNamed(
        context,
        '/camera/view',
        arguments: CameraPageViewArguments(
          file.path,
          user: widget.user,
          isVideo: true,
        ),
      );
    });
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
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (setting) => false,
                ),
                icon: SvgPicture.asset(
                  'assets/icons/close.svg',
                  color: Colors.white,
                  height: globalSizeIcon,
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
                            height: globalSizeIcon,
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
                    GestureDetector(
                      onTap: () => takePhoto(context),
                      onLongPress: () {
                        setState(() {
                          isRecord = true;
                        });
                        startRecord();
                        _animationController
                            .reverse(
                          from: _animationController.value == 0.0
                              ? 1.0
                              : _animationController.value,
                        )
                            .then((value) {
                          stopRecord();
                          setState(() {
                            isRecord = false;
                          });
                        });
                      },
                      onLongPressUp: () {
                        if (isRecord) {
                          stopRecord();
                          _animationController.reset();
                        }
                      },
                      child: Column(
                        children: [
                          CustomPaint(
                            painter: CustomTimerPainter(
                              animation: _animationController,
                              backgroundColor: Colors.transparent,
                              color: Colors.white,
                            ),
                            child: Container(
                              width: 80,
                              height: 80,
                              margin: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(200, 255, 255, 255),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          const SizedBox(height: globalSpacing / 2),
                          Text(
                            isRecord ? 'Grabando' : 'Capturar',
                            style: const TextStyle(
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
                            height: globalSizeIcon,
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

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter oldDelegate) {
    return animation.value != oldDelegate.animation.value ||
        color != oldDelegate.color ||
        backgroundColor != oldDelegate.backgroundColor;
  }
}
