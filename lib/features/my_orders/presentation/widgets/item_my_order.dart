import 'package:flutter/material.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/theme/app_theme.dart';
import 'package:tracking_app/features/home/presentation/widgets/card_item_widget.dart';

class ItemMyOrder extends StatelessWidget {
  ItemMyOrder({
    super.key,
    required this.storeName,
    required this.storeImage,
    required this.storeLatLong,
    required this.userName,
    required this.userImage,
    required this.userLatLong,
    required this.orderStatus,
    required this.userLastName,
    required this.orderId,
    required this.statusColor,
    required this.onPressed,
    required this.icons, required Icon icon
  });

  final String storeName;
  final String storeImage;
  final String storeLatLong;
  final String userName;
  final String userLastName;
  final String userImage;
  final String userLatLong;
  final String orderStatus;
  final String orderId;
  final Color statusColor;
  final void Function()? onPressed;
  final Icon icons ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flower order',
                style: AppTheme.lightTheme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      icons,
                      const SizedBox(width: 8),
                      Text(
                        orderStatus,
                        style: AppTheme.lightTheme.textTheme.titleSmall?.copyWith(
                          color: statusColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    orderId,
                    style: AppTheme.lightTheme.textTheme.titleSmall
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Pickup address',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColors.white[AppColors.colorCode90],
                ),
              ),
              CardItemWidget(
                title: storeName,
                address: storeLatLong,
                image: storeImage,
              ),
              const SizedBox(height: 16),
              Text(
                'User address',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColors.white[AppColors.colorCode90],
                ),
              ),
              CardItemWidget(
                title: userName + userLastName,
                address: storeLatLong,
                image: userImage,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
