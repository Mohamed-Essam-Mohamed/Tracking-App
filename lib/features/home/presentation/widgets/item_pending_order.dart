import 'package:flutter/material.dart';

import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/theme/app_theme.dart';
import 'package:tracking_app/features/home/domain/entities/item_order_details_entity.dart';
import 'package:tracking_app/features/home/presentation/widgets/card_item_widget.dart';

class ItemPendingOrder extends StatelessWidget {
  const ItemPendingOrder(
      {super.key, required this.orderEntity, this.onPressedReject, this.onPressedAccept});
  final OrderEntity orderEntity;
  final void Function()? onPressedReject;
  final void Function()? onPressedAccept;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            const SizedBox(height: 16),
            Text(
              'Pickup address',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.white[AppColors.colorCode90],
                  ),
            ),
            CardItemWidget(
              title: orderEntity.store.name,
              address: orderEntity.store.latLong,
              image: orderEntity.store.image,
            ),
            const SizedBox(height: 16),
            Text(
              'User address',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.white[AppColors.colorCode90],
                  ),
            ),
            CardItemWidget(
              title: '${orderEntity.user.firstName} ${orderEntity.user.lastName}',
              address: orderEntity.store.latLong,
              image: orderEntity.user.photo,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'EGP ${orderEntity.totalPrice}',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: onPressedReject,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.pink),
                        borderRadius: BorderRadius.all(Radius.circular(10000)),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 31),
                    ),
                    child: const Text(
                      'Reject',
                      style: TextStyle(color: AppColors.pink),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: onPressedAccept,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 31),
                    ),
                    child: const Text('Accept'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
