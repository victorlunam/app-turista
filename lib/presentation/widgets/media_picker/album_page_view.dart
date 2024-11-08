import 'package:app_turista/presentation/widgets/media_picker/image_picker_view.dart';
import 'package:app_turista/presentation/widgets/media_picker/media_picker.dart';
import 'package:app_turista/presentation/widgets/media_picker/photo_provider.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

class AlbumPageView extends StatefulWidget {
  const AlbumPageView({super.key});
  @override
  AlbumPageViewState createState() => AlbumPageViewState();
}

class AlbumPageViewState extends State<AlbumPageView>
    with TickerProviderStateMixin {
  int _indexTabBar = 0;
  bool _openFolders = false;
  late final _animatedIconController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );
  late final _tabController = TabController(length: 2, vsync: this);
  late PhotoProvider photoProvider;
  AssetPathEntity? assetsPathEntity;

  ThumbnailOption get thumbOption => ThumbnailOption(
        size: const ThumbnailSize(100, 100),
        format: photoProvider.thumbnailFormat,
      );

  @override
  void initState() {
    super.initState();

    photoProvider = Provider.of<PhotoProvider>(context, listen: false);
    photoProvider.refreshGalleryList().then((value) {
      setState(() {
        assetsPathEntity = photoProvider.assetPathList[0];
      });
    });
  }

  _toogleAnimatedIcon() {
    _openFolders
        ? _animatedIconController.reverse()
        : _animatedIconController.forward();

    setState(() {
      _openFolders = !_openFolders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppBar().preferredSize.height + globalSpacing,
        leading: IconButton(
          onPressed: () {
            if (photoProvider.checked.isEmpty) {
              Navigator.of(context).pop();
            }
            setState(() {
              photoProvider.clearChecked();
            });
          },
          icon: SvgPicture.asset(
            './assets/icons/close_flat.svg',
            height: globalSizeIcon,
          ),
        ),
        centerTitle: true,
        title: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: _toogleAnimatedIcon,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                photoProvider.checked.isEmpty
                    ? assetsPathEntity != null
                        ? assetsPathEntity!.name
                        : ''
                    : "Todos",
              ),
              const SizedBox(width: globalSpacing),
              RotationTransition(
                turns: Tween(begin: 0.0, end: 0.5)
                    .animate(_animatedIconController),
                child: SvgPicture.asset(
                  './assets/icons/arrow_down.svg',
                  height: globalSizeIcon,
                ),
              ),
            ],
          ),
        ),
        bottom: !_openFolders
            ? TabBar(
                padding: const EdgeInsets.fromLTRB(
                    globalSpacing, 0, globalSpacing, globalSpacing),
                controller: _tabController,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                onTap: (index) {
                  setState(() {
                    _indexTabBar = index;
                  });
                },
                tabs: [
                  Tab(
                    icon: SvgPicture.asset(
                      './assets/icons/moments.svg',
                      height: globalSizeIcon,
                      color: _indexTabBar != 0
                          ? const Color(0xFF939393)
                          : Colors.black,
                    ),
                  ),
                  Tab(
                    icon: SvgPicture.asset(
                      './assets/icons/play.svg',
                      height: globalSizeIcon,
                      color: _indexTabBar != 1
                          ? const Color(0xFF939393)
                          : Colors.black,
                    ),
                  ),
                ],
              )
            : null,
      ),
      body: FutureBuilder<int>(
          future: assetsPathEntity!.assetCountAsync,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return !_openFolders
                ? TabBarView(
                    controller: _tabController,
                    children: [
                      assetsPathEntity != null
                          ? ImagePickerView(
                              assetCountToDisplay: snapshot.data!,
                              axis: Axis.vertical,
                              // extraOption: false,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: globalSpacing / 5,
                                crossAxisSpacing: globalSpacing / 5,
                              ),
                              path: assetsPathEntity,
                              addToChecked: () {
                                setState(() {});
                              },
                              removeFromChecked: () {
                                setState(() {});
                              },
                            )
                          : const SizedBox(),
                      assetsPathEntity != null
                          ? ImagePickerView(
                              assetCountToDisplay: snapshot.data!,
                              axis: Axis.vertical,
                              // extraOption: false,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 9 / 16,
                                mainAxisSpacing: globalSpacing / 5,
                                crossAxisSpacing: globalSpacing / 5,
                              ),
                              path: assetsPathEntity?.copyWith(
                                  type: RequestType.video),
                              filterTo: AssetType.video,
                              addToChecked: () {
                                setState(() {});
                              },
                              removeFromChecked: () {
                                setState(() {});
                              },
                            )
                          : const SizedBox(),
                    ],
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: photoProvider.assetPathList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            assetsPathEntity =
                                photoProvider.assetPathList[index];
                            _openFolders = !_openFolders;
                            _indexTabBar = 0;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: globalSpacing / 2,
                            horizontal: globalSpacing * 2,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.circular(globalBorderRadius),
                                ),
                                child: FutureBuilder(
                                  future: photoProvider.assetPathList[index]
                                      .getAssetListRange(start: 0, end: 1),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<List<AssetEntity>>
                                          snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    }
                                    final entity = snapshot.data![0];
                                    return ImageThumbnail(
                                      key: ValueKey(entity),
                                      entity: entity,
                                      option: thumbOption,
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(width: globalSpacing),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      photoProvider.assetPathList[index].name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    FutureBuilder(
                                      future: photoProvider
                                          .assetPathList[index].assetCountAsync,
                                      builder: (context, snapshotChild) {
                                        final textAssetCount = snapshotChild
                                                .hasData
                                            ? '${snapshotChild.data.toString()} archivos'
                                            : '';

                                        return Text(
                                          textAssetCount,
                                          style: const TextStyle(
                                            color: Color(0xFF939393),
                                            fontSize: 16,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          }),
      bottomNavigationBar: !_openFolders
          ? SafeArea(
              child: Container(
                padding: const EdgeInsets.all(globalSpacing),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: photoProvider.checked.isEmpty ? null : () {},
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.resolveWith<Color?>((states) {
                            if (states.contains(WidgetState.pressed)) {
                              return const Color(0xFF1B8F26);
                            }
                            if (states.contains(WidgetState.disabled)) {
                              return Colors.white;
                            }
                            return null;
                          }),
                          shape:
                              WidgetStateProperty.resolveWith<OutlinedBorder?>(
                                  (states) {
                            if (states.contains(WidgetState.pressed)) {
                              return null;
                            }
                            if (states.contains(WidgetState.disabled)) {
                              return RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(globalBorderRadius),
                              );
                            }
                            return null;
                          }),
                          side: WidgetStateProperty.resolveWith<BorderSide?>(
                              (states) {
                            if (states.contains(WidgetState.pressed)) {
                              return null;
                            }
                            if (states.contains(WidgetState.disabled)) {
                              return const BorderSide(color: Colors.black);
                            }
                            return null;
                          }),
                          textStyle: WidgetStateProperty.all<TextStyle?>(
                            const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          foregroundColor:
                              WidgetStateProperty.resolveWith<Color?>((states) {
                            if (states.contains(WidgetState.pressed)) {
                              return Colors.white;
                            }
                            if (states.contains(WidgetState.disabled)) {
                              return Colors.black;
                            }
                            return null;
                          }),
                        ),
                        child: const Text(
                          'Siguiente',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
