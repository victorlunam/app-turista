import 'package:appturista/components/media_picker/media_picker.dart';
import 'package:appturista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:appturista/components/media_picker/photo_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

class ImagePickerView extends StatefulWidget {
  final AssetPathEntity? path;
  final Axis axis;
  final SliverGridDelegate gridDelegate;
  final Function()? addToChecked;
  final Function()? removeFromChecked;
  final int assetCountToDisplay;
  final List<AssetPathEntity?>? pathList;
  final AssetType? filterTo;
  ScrollController? scrollController;

  ImagePickerView({
    Key? key,
    this.pathList,
    required this.assetCountToDisplay,
    this.addToChecked,
    this.removeFromChecked,
    required this.axis,
    required this.gridDelegate,
    this.scrollController,
    required this.path,
    this.filterTo,
  }) : super(key: key) {
    scrollController ??= ScrollController();
  }

  @override
  _ImagePickerViewState createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView>
    with TickerProviderStateMixin {
  bool showImage = false;
  List<AssetEntity> show = [];
  AssetPathEntity? get path => widget.path;
  int gridIndex = 0;
  late PhotoProvider photoProvider;
  AssetEntityImageProvider? showImageProvidder() {
    late AssetEntityImageProvider temp;
    if (show.length == 1) {
      temp = AssetEntityImageProvider(show[0]);
    }
    return temp;
  }

  AssetPathProvider? provider;
  @override
  void initState() {
    super.initState();
    path?.getAssetListRange(start: 0, end: path!.assetCount).then((value) {
      if (value.isEmpty) {
        return;
      }
      if (mounted) {
        return;
      }

      PhotoCachingManager().requestCacheAssets(
        assets: value,
        option: thumbOption,
      );
    });
  }

  @override
  void didUpdateWidget(ImagePickerView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    photoProvider = Provider.of<PhotoProvider>(context, listen: false);
    provider = Provider.of<PhotoProvider>(context, listen: false)
        .getOrCreatePathProvider(path);
    print('Dependencies changeing');
  }

  @override
  void dispose() {
    PhotoCachingManager().cancelCacheRequest();
    super.dispose();
  }

  ThumbnailOption get thumbOption => ThumbnailOption(
        size: const ThumbnailSize(200, 200),
        format: photoProvider.thumbnailFormat,
      );
  @override
  Widget build(BuildContext context) {
    var length = path?.assetCount ?? 1;
    return ChangeNotifierProvider<AssetPathProvider?>.value(
      value: provider,
      child: Consumer<AssetPathProvider?>(
        builder: (context, value, child) => buildRefreshIndicator(length),
      ),
    );
  }

  Widget buildRefreshIndicator(int length) {
    if (!provider!.isInit) {
      provider!.onRefresh();
      print('object');
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    // final list = provider!.list;

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: widget.axis,
      controller: widget.scrollController,
      itemBuilder: (context, index) => _buildItem(context, index),
      itemCount: widget.assetCountToDisplay,
      gridDelegate: widget.gridDelegate,
    );
  }

  final loadWidget = Center(
    child: SizedBox.fromSize(
      size: const Size.square(30),
      child: const CircularProgressIndicator(),
    ),
  );

  Widget _buildItem(BuildContext context, int index) {
    final list = provider!.list;
    if (list.length == index) {
      onLoadMore();
      return Container(
        color: Colors.white10,
      );
    }
    if (index > list.length) {
      return Container(
        color: Colors.white10,
      );
    }
    final entity = list[index];
    return GestureDetector(
      onTap: () {
        if (photoProvider.checked.contains(entity)) {
          photoProvider.removeFromChecked(entity);
          widget.removeFromChecked!();
        } else {
          photoProvider.addToChecked(entity);
          widget.addToChecked!();
        }
        // setState(() {});
      },
      child: Stack(
        children: [
          ImageThumbnail(
            key: ValueKey(entity),
            entity: entity,
            option: thumbOption,
          ),
          if (photoProvider.checked.contains(entity))
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white.withOpacity(0.6),
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 25,
                  width: 25,
                  margin: const EdgeInsets.only(
                    bottom: globalSpacing,
                    right: globalSpacing,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFF4E9028),
                  ),
                  child: SvgPicture.asset(
                    './assets/icons/check_single.svg',
                    color: Colors.white,
                    height: globalSizeIcon * 0.6,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> onLoadMore() async {
    if (!mounted) {
      return;
    }
    await provider!.onLoadMore();
  }

  Future<void> _onRefresh() async {
    if (!mounted) {
      return;
    }
    await provider!.onRefresh();
  }
}
