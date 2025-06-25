import 'dart:io';

import 'package:dreamvila/core/generated/assets.gen.dart';
import 'package:dreamvila/core/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class CommonImageInput extends StatelessWidget {
  final String label;
  final List<String> imagePaths;       // List of file/image paths
  final VoidCallback onTap;            // Called when user taps to add image(s)
  final void Function(int)? onRemove;  // Called when user taps "X" to remove
  final double height;
  final double width;
  final bool allowMultiple;

  const CommonImageInput({
    Key? key,
    required this.label,
    required this.imagePaths,
    required this.onTap,
    this.onRemove,
    this.height = 150,
    this.width = 250,
    this.allowMultiple = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasImages = imagePaths.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(
          height: 30.h,
        ),
        Center(
          child: DottedBorder(
            color: Colors.black,
            strokeWidth: 1,
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            dashPattern: const [13, 13],
            child: GestureDetector(
              onTap: onTap,
              child: hasImages
                  ? SizedBox(
                height: height,
                width: width,
                child: allowMultiple
                    ? PageView.builder(
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(imagePaths[index]),
                            fit: BoxFit.cover,
                            width: width,
                            height: height,
                          ),
                        ),
                        if (onRemove != null)
                          Positioned(
                            top: -10,
                            right: -10,
                            child: IconButton(
                              icon: const Icon(Icons.cancel_rounded, color: Colors.red),
                              onPressed: () => onRemove!(index),
                            ),
                          ),
                      ],
                    );
                  },
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(imagePaths.first),
                    fit: BoxFit.cover,
                    width: width,
                    height: height,
                  ),
                ),
              )
                  : Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: Assets.images.svgs.icons.icCloud.path,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Select Image",
                      style: TextStyle(color: Color(0xFF2F2F2F)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
