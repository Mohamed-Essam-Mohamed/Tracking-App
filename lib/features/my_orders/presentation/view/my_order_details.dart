import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/theme/app_theme.dart';
import 'package:tracking_app/features/home/presentation/widgets/product_item.dart';
import 'package:tracking_app/features/my_orders/domain/entities/driver_orders_entities.dart';
import 'package:tracking_app/features/my_orders/presentation/view_model/driver_orders_cubit.dart';
import 'package:tracking_app/features/my_orders/presentation/view_model/driver_orders_state.dart';
import 'package:tracking_app/features/my_orders/presentation/widgets/address.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';


class MyOrderDetailsScreen extends StatefulWidget {
  const MyOrderDetailsScreen({super.key, required this.order});
  final OrdersEntities order;

  @override
  State<MyOrderDetailsScreen> createState() => _MyOrderDetailsScreenState();
}

class _MyOrderDetailsScreenState extends State<MyOrderDetailsScreen> {
  late final DriverOrdersCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<DriverOrdersCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.OrderDetails_orderDetails.tr(),
            style: AppTheme.lightTheme.textTheme.titleLarge),
        leading: const BackButton(),
      ),
      body: BlocBuilder<DriverOrdersCubit, DriverOrdersState>(
        builder: (context, state) {
          final orderStatus =widget.order.order?.state??'';
          final statusColor = orderStatus.toLowerCase() == 'canceled'
              ? Colors.red
              : Colors.green;
          final icon = orderStatus.toLowerCase() == 'canceled'
              ? Icon(Icons.cancel_outlined, color: Colors.red)
              : Icon( Icons.check_circle_outline_rounded, color: Colors.green);
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              icon,
                              const SizedBox(width: 8),
                              Text(
                                widget.order.order?.state??'',
                                style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                                  fontSize: 20,
                                  color: statusColor,
                                ),
                              ),
                            ],
                          ),Text(
                            widget.order.order?.orderNumber??'',
                            style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height:16),
                      Address(
                        title: LocaleKeys.OrderDetails_PickupAddress.tr(),
                        name: widget.order.store?.name??'',
                        address: widget.order.store?.address??'',
                        imagePath: widget.order.store?.image??'',

                      ),
                      const SizedBox(height: 12),
                      Address(
                        title: LocaleKeys.OrderDetails_UserAddress.tr(),
                        name:
                        '${widget.order.order?.user?.firstName??''} ${widget.order.order?.user?.lastName}',
                        address: widget.order.store?.address??'',
                        imagePath: widget.order.order?.user?.photo??'',
                      ),
                      const SizedBox(height: 16),
                      Text(LocaleKeys.OrderDetails_orderDetails.tr(),
                          style: AppTheme.lightTheme.textTheme.titleMedium),
                      const SizedBox(height: 8),
                      ...List.generate(widget.order.order?.orderItems?.length ?? 0, (index) {
                        final item = widget.order.order!.orderItems?[index];
                        final product = item?.product;
                        return ProductItem(
                          name: product?.title??'',
                          quantity: product?.quantity??0,
                          price: product?.price??0,
                          image: product?.imgCover??'',
                        );
                      }),
                      const SizedBox(height: 10),
                      _buildSummaryRow(
                        LocaleKeys.OrderDetails_Total.tr(),
                        '${LocaleKeys.Home_EGP.tr()} ${widget.order.order!.totalPrice??0}',
                        isBold: true,
                      ),
                      const SizedBox(height: 10),
                      _buildSummaryRow(
                        LocaleKeys.OrderDetails_PaymentMethod.tr(),
                        widget.order.order!.paymentType ?? '',
                        isBold: true,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }



  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Card(
      elevation: 1,
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTheme.lightTheme.textTheme.titleSmall,
            ),
            Text(
              value,
              style: AppTheme.lightTheme.textTheme.titleSmall?.copyWith(
                color: AppColors.gray,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
