import 'package:app_turista/presentation/profile/page.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Moments extends StatefulWidget {
  const Moments({super.key, required this.list});

  final List<Map<String, dynamic>> list;

  @override
  State<Moments> createState() => _MomentsState();
}

class _MomentsState extends State<Moments> {
  List<int> listIndexItemsLiked = [];

  handleChangeLiked(int index) {
    int itemIndex = listIndexItemsLiked.indexOf(index);
    if (itemIndex == -1) {
      setState(() {
        listIndexItemsLiked.add(index);
      });
      return;
    }
    setState(() {
      listIndexItemsLiked.removeAt(itemIndex);
    });
  }

  bool includeItemInListLiked(int index) {
    int itemIndex = listIndexItemsLiked.indexOf(index);
    if (itemIndex == -1) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: globalSpacing),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: globalSpacing),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/profile',
                        arguments: ProfilePageArguments(),
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          widget.list[index]['userPhotoPath'] ?? '',
                        ),
                      ),
                    ),
                    const SizedBox(width: globalSpacing),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.list[index]['username'],
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            '/search/view',
                            arguments: widget.list[index]['place'],
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/pin_map.svg',
                                color: const Color(0xFFB1B1B1),
                                height: globalSizeIcon,
                              ),
                              const SizedBox(width: globalSpacing / 2),
                              Text(
                                widget.list[index]['place'],
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      widget.list[index]['date'],
                      style: const TextStyle(
                        color: Color(0xFF939393),
                      ),
                    ),
                    const SizedBox(width: globalSpacing),
                    SvgPicture.asset(
                      'assets/icons/dots.svg',
                      color: const Color(0xFFB1B1B1),
                      height: globalSizeIcon,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: globalSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.list[index]['description'] ?? ''),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '...ver más',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.list[index]['image'] ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(globalSpacing),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => handleChangeLiked(index),
                      child: includeItemInListLiked(index)
                          ? SvgPicture.asset(
                              'assets/icons/favorite_filled.svg',
                              color: const Color(0xFFFF2953),
                              height: globalSizeIcon,
                            )
                          : SvgPicture.asset(
                              'assets/icons/favorite.svg',
                              color: const Color(0xFFB1B1B1),
                              height: globalSizeIcon,
                            ),
                    ),
                    const SizedBox(width: globalSpacing / 2),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/likes'),
                      child: Text(
                        widget.list[index]['likes'].toString(),
                        style: TextStyle(
                          color: includeItemInListLiked(index)
                              ? const Color(0xFFFF2953)
                              : const Color(0xFFB1B1B1),
                        ),
                      ),
                    ),
                    const SizedBox(width: globalSpacing),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/comments'),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/messages.svg',
                            color: const Color(0xFFB1B1B1),
                            height: globalSizeIcon,
                          ),
                          const SizedBox(width: globalSpacing / 2),
                          Text(
                            widget.list[index]['comments'].toString(),
                            style: const TextStyle(
                              color: Color(0xFFB1B1B1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    SvgPicture.asset(
                      'assets/icons/bookmark.svg',
                      color: const Color(0xFFB1B1B1),
                      height: globalSizeIcon,
                    ),
                    const SizedBox(width: globalSpacing),
                    SvgPicture.asset(
                      'assets/icons/shared.svg',
                      color: const Color(0xFFB1B1B1),
                      height: globalSizeIcon,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
