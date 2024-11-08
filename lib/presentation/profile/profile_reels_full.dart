import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/presentation/widgets/bottom_navigation.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

int countNotification = 2;

class ProfileReelsFull extends StatefulWidget {
  const ProfileReelsFull({super.key});

  @override
  State<ProfileReelsFull> createState() => _ProfileReelsFullState();
}

class _ProfileReelsFullState extends State<ProfileReelsFull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Image(
                image: AssetImage('assets/images/portrait.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildBackButton(context, color: Colors.white),
                const Text(
                  'Joselu123',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 35),
              ],
            ),
            Positioned(
              right: globalSpacing,
              bottom: MediaQuery.of(context).size.height * 0.20,
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/favorite_filled.svg',
                    color: const Color(0xFFFF2953),
                    height: globalSizeIcon * 2,
                  ),
                  const Text(
                    '270',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: globalSpacing * 2),
                  SvgPicture.asset(
                    'assets/icons/messages.svg',
                    color: Colors.white,
                    height: globalSizeIcon * 2,
                  ),
                  const Text(
                    '38',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: globalSpacing * 2),
                  SvgPicture.asset(
                    'assets/icons/shared.svg',
                    color: Colors.white,
                    height: globalSizeIcon * 2,
                  ),
                  const Text(
                    '21',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: globalSpacing * 2),
                  SvgPicture.asset(
                    'assets/icons/bookmark.svg',
                    color: Colors.white,
                    height: globalSizeIcon * 2,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: globalSpacing,
              left: globalSpacing,
              right: globalSpacing,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/users/user_1.png'),
                          ),
                          const SizedBox(width: globalSpacing),
                          Text(
                            'Jose Luis Trujillo',
                            style:
                                Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                      const Text(
                        'Las maravillas que nos ofrece nuestro Perú',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(
        currentIndex: 2,
        iconColor: Colors.white,
        backgroundColor: Colors.black,
        isReel: true,
      ),
    );
  }
}
