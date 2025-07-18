import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/common/widget/custom_cache_network_image.dart';
import 'package:tracking_app/core/constants/app_assets.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/theme/app_theme.dart';

class Address extends StatelessWidget {
  const Address(
      {super.key,
        required this.title,
        required this.name,
        required this.address,
        required this.imagePath,
     });

  final String title;
  final String name;
  final String address;
  final String imagePath;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTheme.lightTheme.textTheme.titleMedium),
        const SizedBox(height: 8),
        Card(
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CustomCacheNetworkImage(
                  imageUrl: _checkImageUrl(imagePath) ?? imageCover,
                  isCircular: true,
                  width: 44,
                  height: 44,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        name,
                        style: AppTheme.lightTheme.textTheme.bodySmall,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 16,
                            color: AppColors.black,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              address,
                              style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }

  String? _checkImageUrl(String image) {
    final uri = Uri.tryParse(image);

    if (uri == null || !(uri.isAbsolute)) {
      return null;
    }
    return image;
  }
}
