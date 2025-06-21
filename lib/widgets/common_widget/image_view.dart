import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class CustomImageView extends StatelessWidget {
  final String? imagePath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final BoxBorder? border;
  final BlendMode? colorBlendMode;
  final bool usePlaceholder;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;

  const CustomImageView({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.colorBlendMode,
    this.usePlaceholder = true,
    this.fadeInDuration = const Duration(milliseconds: 300),
    this.fadeOutDuration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment!, child: _buildWidget())
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(onTap: onTap, child: _buildCircleImage()),
    );
  }

  Widget _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: _buildImageWithBorder(),
      );
    } else {
      return _buildImageWithBorder();
    }
  }

  Widget _buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(border: border, borderRadius: radius),
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (imagePath != null) {
      switch (imagePath!.imageType) {
        case ImageType.svg:
          return SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              imagePath!,
              height: height,
              width: width,
              fit: fit ?? BoxFit.contain,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
            ),
          );
        case ImageType.file:
          final file = File(imagePath!);
          if (file.existsSync()) {
            return Image.file(
              file,
              height: height,
              width: width,
              fit: fit ?? BoxFit.cover,
              color: color,
            );
          } else {
            return _buildErrorWidget();
          }
        case ImageType.network:
          return CachedNetworkImage(
            height: height,
            width: width,
            fit: fit,
            imageUrl: imagePath!,
            filterQuality: FilterQuality.medium,
            color: color,
            repeat: ImageRepeat.noRepeat,
            placeholderFadeInDuration: fadeInDuration,
            fadeInDuration: fadeInDuration,
            fadeOutDuration: fadeOutDuration,
            colorBlendMode: colorBlendMode ?? BlendMode.srcOver,
            fadeOutCurve: Curves.easeOut,
            placeholder: usePlaceholder
                ? (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade50,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey.shade200),
              ),
            )
                : null,
            cacheManager: CacheManager(
              Config(
                'APP_NAME',
                stalePeriod: const Duration(days: 7),
                maxNrOfCacheObjects: 2000,
                repo: JsonCacheInfoRepository(databaseName: 'APP_NAME'),
                fileService: HttpFileService(),
              ),
            ),
            errorWidget: (context, url, error) => _buildErrorWidget(),
          );
        case ImageType.lottie:
          return Lottie.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
          );
        case ImageType.png:
        default:
          return Image.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
            filterQuality: FilterQuality.medium,
            gaplessPlayback: true,
            alignment: Alignment.center,
            errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
          );
      }
    }

    return const SizedBox.shrink();
  }

  Widget _buildErrorWidget() {
    return Container(
      height: height,
      width: width,
      color: Colors.grey.shade200,
      child: const Icon(Icons.broken_image, size: 30, color: Colors.grey),
    );
  }
}

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (startsWith('http') || startsWith('https')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (endsWith('.json')) {
      return ImageType.lottie;
    } else if (startsWith('/data') || startsWith('/storage')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

enum ImageType { svg, png, network, file, lottie, unknown }
