import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<String> items = [
  'assets/images/reels/1.png',
  'assets/images/reels/2.png',
  'assets/images/reels/3.png',
  'assets/images/reels/4.png',
  'assets/images/reels/1.png',
  'assets/images/reels/2.png',
  'assets/images/reels/3.png',
  'assets/images/reels/4.png',
];

class ProfileReels extends StatelessWidget {
  const ProfileReels({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: globalSpacing / 5,
        crossAxisSpacing: globalSpacing / 5,
        crossAxisCount: 2,
        childAspectRatio: 9 / 16,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext ctx, index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/profile/view/reels'),
          child: Container(
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(items[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(globalSpacing / 2),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/play_triangle.svg',
                    color: Colors.white,
                    height: globalSizeIcon,
                  ),
                  const Text(
                    '152',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
