import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';

List<String> items = [
  'assets/images/moments/5.png',
  'assets/images/moments/6.png',
  'assets/images/moments/7.png',
  'assets/images/moments/1.png',
  'assets/images/moments/2.png',
  'assets/images/moments/3.png',
  'assets/images/moments/4.png',
  'assets/images/moments/8.png',
  'assets/images/moments/9.png',
];

class ProfilePrivate extends StatelessWidget {
  const ProfilePrivate({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: globalSpacing / 5,
        crossAxisSpacing: globalSpacing / 5,
        crossAxisCount: 3,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(items[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
