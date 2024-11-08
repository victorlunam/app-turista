import 'dart:io';

import 'package:app_turista/models/user.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class CameraPageViewArguments {
  final User? user;
  final String path;
  final bool isVideo;

  const CameraPageViewArguments(
    this.path, {
    this.user,
    this.isVideo = false,
  });
}

class CameraViewPage extends StatefulWidget {
  const CameraViewPage({
    super.key,
    required this.path,
    this.user,
    required this.isVideo,
  });

  final User? user;
  final String path;
  final bool isVideo;

  @override
  State<CameraViewPage> createState() => _CameraViewPageState();
}

class _CameraViewPageState extends State<CameraViewPage> {
  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;

  @override
  void initState() {
    _videoController = VideoPlayerController.file(File(widget.path));

    _videoController.addListener(() {
      bool isPlaying = _videoController.value.isPlaying;
      setState(() {
        _isPlaying = isPlaying;
      });
    });

    _initializeVideoPlayerFuture = _videoController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            widget.isVideo
                ? FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (_videoController.value.isPlaying) {
                                _videoController.pause();
                              } else {
                                _videoController.play();
                              }
                            });
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: VideoPlayer(_videoController),
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.file(
                      File(widget.path),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
            if (!_isPlaying && widget.isVideo)
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/icons/play.svg',
                  height: globalSizeIcon * 3,
                  color: Colors.white,
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
                  height: globalSizeIcon,
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
                    arguments: widget.path,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: widget.user == null
                      ? const Text(
                          'Siguiente',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        )
                      : const Row(
                          children: [
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
