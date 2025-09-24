import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.placeholder,
    this.errorWidget,
    this.height,
    this.width,
    this.memCacheHeight,
    this.memCacheWidth,
    this.fit = BoxFit.cover,
    this.filterQuality = FilterQuality.low,
    this.useOldImageOnUrlChange = false,
    this.cacheKey,
    this.borderRadius,
  });

  final String imageUrl;
  final Widget Function(BuildContext, String, Object)? errorWidget;
  final Widget Function(BuildContext, String)? placeholder;
  final double? height;
  final double? width;
  final double? memCacheHeight;
  final double? memCacheWidth;
  final BoxFit fit;
  final FilterQuality filterQuality;
  final String? cacheKey;
  final bool useOldImageOnUrlChange;
  final double? borderRadius;

  bool _isValidImageUrl(String? url) {
    if (url == null || url.isEmpty) {
      return false;
    }
    final uri = Uri.tryParse(url.trim());
    return uri != null &&
        uri.hasScheme &&
        uri.hasAuthority &&
        (uri.isScheme('http') || uri.isScheme('https'));
  }

  @override
  Widget build(BuildContext context) {
    if (!_isValidImageUrl(imageUrl)) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          // border: Border.all(color: ColorName.green1F),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Center(child: Icon(Icons.error_outline, color: Colors.red)),
      );
    }

    return Builder(
      builder: (context) {
        return CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder:
              placeholder ??
              (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade100,
                direction: ShimmerDirection.ltr,
                period: const Duration(milliseconds: 1200),
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(borderRadius ?? 16),
                  ),
                ),
              ),
          errorWidget:
              errorWidget ??
              (context, error, stackTrace) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(borderRadius ?? 16),
                  // border: Border.all(color: ColorName.green1F),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Icon(Icons.error_outline, color: Colors.red),
              ),
          cacheKey: cacheKey,
          useOldImageOnUrlChange: useOldImageOnUrlChange,
          fit: fit,
          height: height,
          width: width,
          filterQuality: filterQuality,
          fadeOutDuration: const Duration(),
          fadeInDuration: const Duration(),
          placeholderFadeInDuration: const Duration(),
          memCacheHeight: memCacheHeight?.toInt(),
          memCacheWidth: memCacheWidth?.toInt(),
        );
      },
    );
  }
}
