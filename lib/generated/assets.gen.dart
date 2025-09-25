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

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_home_focus.svg
  SvgGenImage get icHomeFocus =>
      const SvgGenImage('assets/icons/ic_home_focus.svg');

  /// File path: assets/icons/ic_home_unfocus.svg
  SvgGenImage get icHomeUnfocus =>
      const SvgGenImage('assets/icons/ic_home_unfocus.svg');

  /// File path: assets/icons/ic_profile_focus.svg
  SvgGenImage get icProfileFocus =>
      const SvgGenImage('assets/icons/ic_profile_focus.svg');

  /// File path: assets/icons/ic_profile_unfocus.svg
  SvgGenImage get icProfileUnfocus =>
      const SvgGenImage('assets/icons/ic_profile_unfocus.svg');

  /// File path: assets/icons/ic_register.svg
  SvgGenImage get icRegister =>
      const SvgGenImage('assets/icons/ic_register.svg');

  /// File path: assets/icons/ic_show.svg
  SvgGenImage get icShow => const SvgGenImage('assets/icons/ic_show.svg');

  /// File path: assets/icons/ic_signin.svg
  SvgGenImage get icSignin => const SvgGenImage('assets/icons/ic_signin.svg');

  /// File path: assets/icons/ic_success.svg
  SvgGenImage get icSuccess => const SvgGenImage('assets/icons/ic_success.svg');

  /// File path: assets/icons/ic_unshow.svg
  SvgGenImage get icUnshow => const SvgGenImage('assets/icons/ic_unshow.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    icHomeFocus,
    icHomeUnfocus,
    icProfileFocus,
    icProfileUnfocus,
    icRegister,
    icShow,
    icSignin,
    icSuccess,
    icUnshow,
  ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/loading.json
  String get loading => 'assets/lottie/loading.json';

  /// File path: assets/lottie/success.json
  String get success => 'assets/lottie/success.json';

  /// List of all assets
  List<String> get values => [loading, success];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
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
