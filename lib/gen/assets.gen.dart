// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsCoverGen {
  const $AssetsCoverGen();

  /// File path: assets/cover/cover1.png
  AssetGenImage get cover1 => const AssetGenImage('assets/cover/cover1.png');

  /// File path: assets/cover/cover2.png
  AssetGenImage get cover2 => const AssetGenImage('assets/cover/cover2.png');

  /// File path: assets/cover/cover3.png
  AssetGenImage get cover3 => const AssetGenImage('assets/cover/cover3.png');

  /// List of all assets
  List<AssetGenImage> get values => [cover1, cover2, cover3];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/logo-bg.svg
  SvgGenImage get logoBg => const SvgGenImage('assets/logo/logo-bg.svg');

  /// File path: assets/logo/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/logo/logo.png');

  /// List of all assets
  List<dynamic> get values => [logoBg, logo];
}

class $AssetsPopGen {
  const $AssetsPopGen();

  /// File path: assets/pop/done.svg
  SvgGenImage get done => const SvgGenImage('assets/pop/done.svg');

  /// File path: assets/pop/emogi1.svg
  SvgGenImage get emogi1 => const SvgGenImage('assets/pop/emogi1.svg');

  /// File path: assets/pop/emogi2.svg
  SvgGenImage get emogi2 => const SvgGenImage('assets/pop/emogi2.svg');

  /// File path: assets/pop/emogi3.svg
  SvgGenImage get emogi3 => const SvgGenImage('assets/pop/emogi3.svg');

  /// List of all assets
  List<SvgGenImage> get values => [done, emogi1, emogi2, emogi3];
}

class $AssetsProductGen {
  const $AssetsProductGen();

  /// File path: assets/product/product1.png
  AssetGenImage get product1 =>
      const AssetGenImage('assets/product/product1.png');

  /// File path: assets/product/product2.png
  AssetGenImage get product2 =>
      const AssetGenImage('assets/product/product2.png');

  /// File path: assets/product/product3.png
  AssetGenImage get product3 =>
      const AssetGenImage('assets/product/product3.png');

  /// File path: assets/product/product4.png
  AssetGenImage get product4 =>
      const AssetGenImage('assets/product/product4.png');

  /// File path: assets/product/product5.png
  AssetGenImage get product5 =>
      const AssetGenImage('assets/product/product5.png');

  /// File path: assets/product/product6.png
  AssetGenImage get product6 =>
      const AssetGenImage('assets/product/product6.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    product1,
    product2,
    product3,
    product4,
    product5,
    product6,
  ];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/Mastercard.svg
  SvgGenImage get mastercard => const SvgGenImage('assets/svgs/Mastercard.svg');

  /// File path: assets/svgs/Menu.svg
  SvgGenImage get menu => const SvgGenImage('assets/svgs/Menu.svg');

  /// File path: assets/svgs/Search.svg
  SvgGenImage get search => const SvgGenImage('assets/svgs/Search.svg');

  /// File path: assets/svgs/arrow.svg
  SvgGenImage get arrow => const SvgGenImage('assets/svgs/arrow.svg');

  /// File path: assets/svgs/delivery.svg
  SvgGenImage get delivery => const SvgGenImage('assets/svgs/delivery.svg');

  /// File path: assets/svgs/line.png
  AssetGenImage get line => const AssetGenImage('assets/svgs/line.png');

  /// File path: assets/svgs/min.svg
  SvgGenImage get min => const SvgGenImage('assets/svgs/min.svg');

  /// File path: assets/svgs/plus.svg
  SvgGenImage get plus => const SvgGenImage('assets/svgs/plus.svg');

  /// File path: assets/svgs/promo.svg
  SvgGenImage get promo => const SvgGenImage('assets/svgs/promo.svg');

  /// File path: assets/svgs/shopping bag.svg
  SvgGenImage get shoppingBag =>
      const SvgGenImage('assets/svgs/shopping bag.svg');

  /// File path: assets/svgs/visa.svg
  SvgGenImage get visa => const SvgGenImage('assets/svgs/visa.svg');

  /// List of all assets
  List<dynamic> get values => [
    mastercard,
    menu,
    search,
    arrow,
    delivery,
    line,
    min,
    plus,
    promo,
    shoppingBag,
    visa,
  ];
}

class $AssetsTextsGen {
  const $AssetsTextsGen();

  /// File path: assets/texts/10.svg
  SvgGenImage get a10 => const SvgGenImage('assets/texts/10.svg');

  /// File path: assets/texts/Collection.svg
  SvgGenImage get collection =>
      const SvgGenImage('assets/texts/Collection.svg');

  /// File path: assets/texts/October.svg
  SvgGenImage get october => const SvgGenImage('assets/texts/October.svg');

  /// List of all assets
  List<SvgGenImage> get values => [a10, collection, october];
}

class Assets {
  const Assets._();

  static const $AssetsCoverGen cover = $AssetsCoverGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
  static const $AssetsPopGen pop = $AssetsPopGen();
  static const $AssetsProductGen product = $AssetsProductGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
  static const $AssetsTextsGen texts = $AssetsTextsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
