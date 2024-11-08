import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class AssetPathProvider extends ChangeNotifier {
  static const loadCount = 80;
  bool isInit = false;

  final AssetPathEntity? path;
  AssetPathProvider(this.path);

  List<AssetEntity> list = [];

  var page = 0;

  Future<int> get showItemCount async {
    final assetCount = await path!.assetCountAsync;
    return assetCount;
  }

  bool refreshing = false;

  Future onRefresh() async {
    if (refreshing) {
      return;
    }
    refreshing = true;
    await path!.obtainForNewProperties(maxDateTimeToNow: false);
    final mList = await path!.getAssetListPaged(page: 0, size: loadCount);
    page = 0;
    list.clear();
    list.addAll(mList);
    isInit = true;
    notifyListeners();
    refreshing = false;
  }

  Future<void> onLoadMore() async {
    if (refreshing) {
      return;
    }

    final [assetCountValue, showItemCountValue] = await Future.wait([
      path!.assetCountAsync,
      showItemCount,
    ]);

    if (showItemCountValue > assetCountValue) {
      return;
    }
    final list =
        (await path!.getAssetListPaged(page: page + 1, size: loadCount))
            .toList();
    page = page + 1;
    list.addAll(list);
    notifyListeners();
  }
}

class PhotoProvider extends ChangeNotifier {
  List<AssetPathEntity> assetPathList = [];
  List<AssetEntity> checked = [];
  Map<AssetPathEntity?, AssetPathProvider> pathProviderMap = {};

  get checkedItems {
    return checked;
  }

  void removeFromChecked(AssetEntity entity) {
    checked.remove(entity);
    notifyListeners();
  }

  void addToChecked(AssetEntity entity) {
    checked.add(entity);
    notifyListeners();
  }

  void clearChecked() {
    checked.clear();
  }

  Future<void> refreshGalleryList() async {
    final option = makeOption();
    reset();

    var galleryList = await PhotoManager.getAssetPathList(
      type: RequestType.common,
      hasAll: true,
      onlyAll: false,
      filterOption: option,
    );

    final galleryAssetCountList = await Future.wait(
      galleryList.map((gallery) => gallery.assetCountAsync)
    );

    final countMap = Map.fromIterables(galleryList, galleryAssetCountList);

    galleryList.sort((a, b) => countMap[b]!.compareTo(countMap[a]!));

    assetPathList.clear();
    assetPathList.addAll(galleryList);
  }

  AssetPathProvider? getOrCreatePathProvider(AssetPathEntity? pathEntity) {
    pathProviderMap[pathEntity] = AssetPathProvider(pathEntity);
    return pathProviderMap[pathEntity];
  }

  FilterOptionGroup makeOption() {
    DateTime startDate = DateTime(2005);
    DateTime endDate = DateTime.now();
    Duration maxDuration = const Duration(hours: 1);
    String minWidth = "0";
    String maxWidth = "10000";
    String minHeight = "0";
    String maxHeight = "10000";
    bool ignoreSize = true;

    Duration minDuration = Duration.zero;

    final option = FilterOption(
      sizeConstraint: SizeConstraint(
        minWidth: int.tryParse(minWidth) ?? 0,
        maxWidth: int.tryParse(maxWidth) ?? 10000,
        minHeight: int.tryParse(minHeight) ?? 0,
        maxHeight: int.tryParse(maxHeight) ?? 10000,
        ignoreSize: ignoreSize,
      ),
      durationConstraint: DurationConstraint(
        min: minDuration,
        max: maxDuration,
      ),
      needTitle: true,
    );

    final createDateCond = DateTimeCond(
      min: startDate,
      max: endDate,
      ignore: false,
    );

    return FilterOptionGroup()
      ..setOption(AssetType.video, option)
      ..setOption(AssetType.image, option)
      ..createTimeCond = createDateCond
      ..containsPathModified = false
      ..addOrderOption(
        const OrderOption(
          type: OrderOptionType.updateDate,
          asc: false,
        ),
      );
  }

  var _thumbFormat = ThumbnailFormat.png;

  ThumbnailFormat get thumbnailFormat => _thumbFormat;

  set thumbnailFormat(thumbnailFormat) {
    _thumbFormat = thumbnailFormat;
    notifyListeners();
  }

  void reset() {
    assetPathList.clear();
    pathProviderMap.clear();
  }
}
