import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/widget/custom_cache_network_image.dart';
import 'package:tracking_app/core/constants/app_assets.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/theme/app_theme.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });

  final String name;
  final int quantity;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Card(
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // CircleAvatar(
                //   backgroundImage: NetworkImage(image),
                //   radius: 24,
                // ),
                CustomCacheNetworkImage(
                  imageUrl: _checkImageUrl(image) ?? imageCover,
                  isCircular: true,
                  width: 44,
                  height: 44,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(name, style: AppTheme.lightTheme.textTheme.bodySmall),
                        const Spacer(),
                        Text('x $quantity',
                            style: AppTheme.lightTheme.textTheme.labelSmall
                                ?.copyWith(color: AppColors.pink)),
                      ]),
                      const SizedBox(
                        height: 8,
                      ),
                      Text('${LocaleKeys.Home_EGP.tr()}:$price',
                          style: AppTheme.lightTheme.textTheme.labelSmall
                              ?.copyWith(color: AppColors.black)),
                    ],
                  ),
                ),
              ],
            ),
          )),
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
