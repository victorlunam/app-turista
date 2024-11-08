import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:provider/provider.dart';
import 'package:extended_image/extended_image.dart';
import 'package:app_turista/presentation/widgets/media_picker/lru_map.dart';
import 'package:app_turista/presentation/widgets/media_picker/photo_provider.dart';

class ImageThumbnail extends StatefulWidget {
  const ImageThumbnail({
    super.key,
    required this.entity,
    required this.option,
  });
  final AssetEntity entity;
  final ThumbnailOption option;
  
  @override
  ImageThumbnailState createState() => ImageThumbnailState();
}

class ImageThumbnailState extends State<ImageThumbnail> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhotoProvider>(context);
    return ChangeNotifierProvider.value(
      value: provider,
      builder: (context, p) {
        final format = provider.thumbnailFormat;
        return buildContent(format);
      },
    );
  }

  /* @override
  Widget build(BuildContext context) {
    return Provider<PhotoProvider>(
      create: (context) => PhotoProvider(),
      builder: (context, _) {
        final format = context.watch();
        return buildContent(format);
      },
    );
  } */

  final loadWidget = Center(
    child: SizedBox.fromSize(
      size: const Size.square(30),
      child: const CircularProgressIndicator(),
    ),
  );
  Widget buildContent(ThumbnailFormat format) {
    if (widget.entity.type == AssetType.audio) {
      return const Center(
        child: Icon(
          Icons.audiotrack,
          size: 30,
        ),
      );
    }
    final item = widget.entity;
    final size = widget.option.size.width;
    final u8List = ImageLruCache.getData(item, size, format);
    if (u8List != null) {
      return _buildImageWidget(item, u8List, size);
    } else {
      Widget w;
      final AssetEntityImageProvider imageProvider =
          AssetEntityImageProvider(item, isOriginal: false);
      ImageLruCache.setData(item, size, format, imageProvider);
      w = _buildImageWidget(item, imageProvider, size);
      return w;
    }
  }

  Widget _buildImageWidget(
      AssetEntity entity, AssetEntityImageProvider imageProvider, num size) {
    return RepaintBoundary(
      child: ExtendedImage(
        image: imageProvider,
        fit: BoxFit.cover,
        loadStateChanged: (ExtendedImageState state) {
          Widget loader = const SizedBox.shrink();
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              loader = const ColoredBox(color: Color(0x10ffffff));
              break;
            case LoadState.completed:
              loader = Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Positioned.fill(
                    child: RepaintBoundary(child: state.completedWidget),
                  ),
                  if (entity.type == AssetType.video)
                    videoIndicator(context, entity),
                ],
              );
              loader = FadeImageBuilder(child: loader);
              break;
            case LoadState.failed:
              break;
          }
          return loader;
        },
      ),
    );
  }

  Widget videoIndicator(BuildContext context, AssetEntity asset) {
    return PositionedDirectional(
      start: 4,
      bottom: 4,
      child: Container(
        height: 26.0,
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Text(
            durationIndicatorBuilder(
              Duration(seconds: asset.duration),
            ),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold),
            strutStyle: const StrutStyle(
              forceStrutHeight: true,
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }

  String durationIndicatorBuilder(Duration duration) {
    const String separator = ':';
    final String minute = duration.inMinutes.toString().padLeft(2, '0');
    final String second =
        ((duration - Duration(minutes: duration.inMinutes)).inSeconds)
            .toString()
            .padLeft(2, '0');
    return '$minute$separator$second';
  }

  @override
  void didUpdateWidget(ImageThumbnail oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.entity.id != oldWidget.entity.id) {
      setState(() {});
    }
  }
}

class FadeImageBuilder extends StatelessWidget {
  final int milliseconds;
  const FadeImageBuilder(
      {super.key, this.milliseconds = 300, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: milliseconds),
      builder: (_, double value, Widget? w) => Opacity(
        opacity: value,
        child: w,
      ),
      child: child,
    );
  }
}
