import 'package:app_turista/utils/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.pathIcon});

  final String pathIcon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(globalSpacing),
      width: double.infinity,
      child: Row(
        children: [
          SvgPicture.asset(
            pathIcon,
            height: globalSizeIcon * 2,
          ),
          const SizedBox(width: globalSpacing),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<Map<String, String>> destinationList = [
  {"image": "assets/images/machu_picchu.png", "title": "Machu Picchu"},
  {"image": "assets/images/mezquita_azul.png", "title": "Mezquita Azul"},
  {"image": "assets/images/cristo_redentor.png", "title": "Cristo Redentor"},
];

class DestinationsSection extends StatelessWidget {
  const DestinationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.builder(
        padding: const EdgeInsets.all(globalSpacing),
        scrollDirection: Axis.horizontal,
        itemCount: destinationList.length,
        itemBuilder: (BuildContext ctx, index) {
          double margin =
              destinationList.length == (index - 1) ? 0 : globalSpacing / 5;
          return InkWell(
            onTap: () => Navigator.pushNamed(context, '/moment/detail'),
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(
                bottom: globalSpacing,
                left: globalSpacing,
              ),
              margin: EdgeInsets.only(right: margin),
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(destinationList[index]['image'] ?? ''),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(globalBorderRadius),
              ),
              child: Text(
                '',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<Map<String, dynamic>> momentsList = [
  {
    "image": "assets/images/place_1.png",
    "username": "Pedro77",
    "userPhotoPath": "assets/images/users/user_1.png",
    "place": "Cuzco",
    "comments": 48,
    "likes": 270,
  },
  {
    "image": "assets/images/place_2.png",
    "username": "Chinalove",
    "userPhotoPath": "assets/images/users/user_2.png",
    "place": "Mancora",
    "comments": 65,
    "likes": 340,
  },
  {
    "image": "assets/images/place_3.png",
    "username": "Pablo12a",
    "userPhotoPath": "assets/images/users/user_3.png",
    "place": "Medellin",
    "comments": 98,
    "likes": 123,
  },
];

class MomentsSection extends StatelessWidget {
  const MomentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      child: ListView.builder(
        padding: const EdgeInsets.all(globalSpacing),
        scrollDirection: Axis.horizontal,
        itemCount: momentsList.length,
        itemBuilder: (BuildContext ctx, index) {
          double margin =
              momentsList.length == (index - 1) ? 0 : globalSpacing / 5;
          return InkWell(
            onTap: () => Navigator.pushNamed(context, '/moment/friends'),
            child: Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(right: margin),
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(momentsList[index]['image'] ?? ''),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(globalBorderRadius),
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(
                  bottom: globalSpacing,
                  left: globalSpacing / 2,
                  right: globalSpacing / 2,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment(0.0, 0.6),
                    colors: [
                      Colors.black54,
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        momentsList[index]['userPhotoPath'] ?? '',
                      ),
                    ),
                    const SizedBox(width: globalSpacing),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          momentsList[index]['username'],
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/search/view',
                            arguments: momentsList[index]['place'],
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/pin_map.svg',
                                height: globalSizeIcon,
                              ),
                              const SizedBox(width: globalSpacing / 2),
                              Text(
                                momentsList[index]['place'],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    SvgPicture.asset(
                      'assets/icons/favorite.svg',
                      height: globalSizeIcon,
                    ),
                    const SizedBox(width: globalSpacing / 2),
                    Text(
                      momentsList[index]['likes'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: globalSpacing),
                    SvgPicture.asset(
                      'assets/icons/messages.svg',
                      color: Colors.white,
                      height: globalSizeIcon,
                    ),
                    const SizedBox(width: globalSpacing / 2),
                    Text(
                      momentsList[index]['comments'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> offerList = [
  'assets/images/offer_1.png',
  'assets/images/offer_2.png',
  'assets/images/offer_3.png',
  'assets/images/offer_4.png',
];

class OffersSection extends StatefulWidget {
  const OffersSection({super.key});

  @override
  State<OffersSection> createState() => _OffersSectionState();
}

class _OffersSectionState extends State<OffersSection> {
  int _current = 0;
  final _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: const EdgeInsets.all(globalSpacing),
          height: MediaQuery.of(context).size.height * 0.2,
          width: double.infinity,
          child: CarouselSlider.builder(
            carouselController: _controller,
            itemCount: offerList.length,
            itemBuilder: (BuildContext ctx, index, y) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(globalBorderRadius * 2),
                  image: DecorationImage(
                    image: AssetImage(offerList[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                width: double.infinity,
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: globalBorderRadius * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: offerList.asMap().entries.map((entry) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == entry.key ? Colors.blue : Colors.white,
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
