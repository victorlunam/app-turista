import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class AssetEntityImageProvider extends ImageProvider<AssetEntityImageProvider> {
  static const List<int> defaultPreviewThumbSize = <int>[200, 200];
  const AssetEntityImageProvider(
    this.entity, {
    this.scale = 1.0,
    this.thumbSize = defaultPreviewThumbSize,
    this.isOriginal = true,
  }) : assert(
          isOriginal || thumbSize.length == 2,
          'thumbSize must contain and only contain two integers when it\'s not original',
        );
  final AssetEntity entity;
  final double scale;
  final List<int> thumbSize;
  final bool isOriginal;
  @override
  ImageStreamCompleter load(
    AssetEntityImageProvider key,
    DecoderCallback decode,
  ) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key, decode),
      scale: key.scale,
      informationCollector: () {
        return <DiagnosticsNode>[
          DiagnosticsProperty<ImageProvider>('Image provider', this),
          DiagnosticsProperty<AssetEntityImageProvider>('Image key', key),
        ];
      },
    );
  }

  @override
  Future<AssetEntityImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<AssetEntityImageProvider>(this);
  }

  Future<ui.Codec> _loadAsync(
    AssetEntityImageProvider key,
    DecoderCallback decode,
  ) async {
    assert(key == this);
    Uint8List? data;
    if (isOriginal) {
      data = await key.entity.originBytes;
    } else {
      final List<int> _thumbSize = thumbSize;
      data = await key.entity
          .thumbnailDataWithSize(ThumbnailSize(_thumbSize[0], _thumbSize[1]));
    }
    if (data == null) {
      throw AssertionError('Null in entity\'s data.');
    }
    return decode(data);
  }

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (identical(this, other)) {
      return true;
    }
    return entity == other.entity &&
        scale == other.scale &&
        thumbSize == other.thumbSize &&
        isOriginal == other.isOriginal;
  }
}
