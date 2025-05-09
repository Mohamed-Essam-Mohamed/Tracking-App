import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/animation/loading_shimmer.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  const CustomCacheNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.isCircular = false,
    this.borderRadius,
  });
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final bool isCircular;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      placeholder: (context, url) => _buildShimmer(),
      errorWidget: (context, url, error) => _buildShimmer(),
      fadeOutDuration: const Duration(milliseconds: 500),
      useOldImageOnUrlChange: true,
    );

    if (isCircular) {
      return ClipOval(child: image);
    } else if (borderRadius != null) {
      return ClipRRect(borderRadius: borderRadius ?? BorderRadius.zero, child: image);
    } else {
      return image;
    }
  }

  Widget _buildShimmer() {
    return LoadingShimmer(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      isCircular: isCircular,
      borderRadius: borderRadius,
    );
  }
}
