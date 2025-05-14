import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/di/service_locator.dart';
import 'package:tracking_app/core/theme/app_theme.dart';
import 'package:tracking_app/features/home/domain/entities/item_order_details_entity.dart';
import 'package:tracking_app/features/home/presentation/view_model/order_details/order_details_cubit.dart';
import 'package:tracking_app/features/home/presentation/view_model/order_details/order_details_state.dart';
import 'package:tracking_app/features/home/presentation/widgets/OrderProgressIndicator.dart';
import 'package:tracking_app/features/home/presentation/widgets/addressSection.dart';
import 'package:tracking_app/features/home/presentation/widgets/product_item.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key, required this.order});

  final OrderEntity order;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final OrderDetailsCubit _cubit = serviceLocator<OrderDetailsCubit>();

  void openWhatsApp({required String phoneNumber}) async {
    final url = 'https://wa.me/$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _makePhoneCall(String phoneNumber) {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.OrderDetails_orderdetails.tr(),
              style: AppTheme.lightTheme.textTheme.titleLarge),
          leading: const BackButton(),
        ),
        body: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
          builder: (context, state) {
            final cubit = context.watch<OrderDetailsCubit>();
            final currentStatus = cubit.currentStatus;

            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OrderProgressIndicator(
                          key: ValueKey(currentStatus),
                          currentStatus: currentStatus,
                        ),
                        const SizedBox(height: 16),
                        _buildStatusCard(widget.order!),
                        const SizedBox(height: 16),
                        AddressSection(
                          title: LocaleKeys.OrderDetails_PickupAddress.tr(),
                          name: widget.order.store.name,
                          address: widget.order.store.address,
                          imagePath: widget.order.store.image,
                          onPressed: () => _makePhoneCall(widget.order.store.phoneNumber),
                          onTap: () =>
                              openWhatsApp(phoneNumber: widget.order.store.phoneNumber),
                        ),
                        const SizedBox(height: 12),
                        AddressSection(
                          title: LocaleKeys.OrderDetails_UserAddress.tr(),
                          name:
                              '${widget.order.user.firstName} ${widget.order.user.lastName}',
                          address: widget.order.user.email,
                          imagePath: widget.order.user.photo,
                          onPressed: () => _makePhoneCall(widget.order.user.phone),
                          onTap: () => openWhatsApp(phoneNumber: widget.order.user.phone),
                        ),
                        const SizedBox(height: 16),
                        Text(LocaleKeys.OrderDetails_orderdetails.tr(),
                            style: AppTheme.lightTheme.textTheme.titleMedium),
                        const SizedBox(height: 8),
                        ...List.generate(widget.order?.orderItems?.length ?? 0, (index) {
                          final item = widget.order?.orderItems?[index];
                          final product = item?.product;
                          return ProductItem(
                            name: product?.title ?? '',
                            quantity: item?.quantity ?? 0,
                            price: product?.price ?? 0,
                            image: product?.imgCover ?? '',
                          );
                        }),
                        const SizedBox(height: 10),
                        _buildSummaryRow(
                          LocaleKeys.OrderDetails_Total.tr(),
                          '${LocaleKeys.Home_EGP.tr()} ${widget.order?.totalPrice}',
                          isBold: true,
                        ),
                        const SizedBox(height: 10),
                        _buildSummaryRow(
                          LocaleKeys.OrderDetails_PaymentMethod.tr(),
                          widget.order?.paymentType ?? '',
                          isBold: true,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    style: AppTheme.lightTheme.elevatedButtonTheme.style?.copyWith(
                      minimumSize:
                          const WidgetStatePropertyAll(Size(double.infinity, 50)),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () {
                      context.read<OrderDetailsCubit>().advanceOrderStatus();
                    },
                    child: Text(
                      LocaleKeys.OrderDetails_ArrivedAtPickupPoint.tr(),
                      style: AppTheme.lightTheme.textTheme.titleSmall
                          ?.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatusCard(
    OrderEntity order,
  ) {
    final formattedTime =
        DateFormat('dd MMM yyyy - hh:mm a').format(DateTime.parse(order.createdAt));

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.lightPink.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${LocaleKeys.OrderDetails_Status.tr()} : ${order.state}',
              style: AppTheme.lightTheme.textTheme.titleSmall?.copyWith(
                color: AppColors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: '${LocaleKeys.OrderDetails_OrderID.tr()} : ',
                  style: AppTheme.lightTheme.textTheme.titleSmall?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: order.orderNumber,
                  style: AppTheme.lightTheme.textTheme.titleSmall?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )),
            const SizedBox(height: 6),
            Text(
              formattedTime,
              style: AppTheme.lightTheme.textTheme.bodySmall
                  ?.copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
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
