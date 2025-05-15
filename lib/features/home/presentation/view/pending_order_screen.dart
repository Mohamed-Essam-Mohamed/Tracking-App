import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/common/widget/error_widget.dart';
import 'package:tracking_app/core/di/service_locator.dart';
import 'package:tracking_app/core/theme/app_theme.dart';
import 'package:tracking_app/features/home/presentation/view/order_details_screen.dart';
import 'package:tracking_app/features/home/presentation/view_model/order_details/order_details_cubit.dart';
import 'package:tracking_app/features/home/presentation/view_model/pending_order/pending_order_cubit.dart';
import 'package:tracking_app/features/home/presentation/widgets/item_pending_order.dart';

class PendingOrderScreen extends StatelessWidget {
  const PendingOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderDetailsCubit = serviceLocator<OrderDetailsCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<PendingOrderCubit>(
        create: (context) => serviceLocator<PendingOrderCubit>()..getAllPendingOrder(),
        child: BlocBuilder<PendingOrderCubit, PendingOrderState>(
          builder: (context, state) {
            if (state.isSuccess) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Flowery rider ',
                        style: AppTheme.lightTheme.textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => ItemPendingOrder(
                          orderEntity: state.orders[index],
                          onPressedAccept: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => BlocProvider.value(
                                  value: orderDetailsCubit,
                                  child: OrderDetailsScreen(order: state.orders[index]),
                                ),
                              ),
                            );
                          },
                          onPressedReject: () async {
                            await context.read<PendingOrderCubit>().getAllPendingOrder();
                          },
                        ),
                        separatorBuilder: (context, index) => const SizedBox(height: 24),
                        itemCount: state.orders.length,
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(child: ErrorStateWidget(
              onRetry: () async {
                await context.read<PendingOrderCubit>().getAllPendingOrder();
              },
            ));
          },
        ),
      ),
    );
  }
}
