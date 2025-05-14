import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tracking_app/core/common/widget/error_widget.dart';
import 'package:tracking_app/core/di/service_locator.dart';
import 'package:tracking_app/features/home/domain/entities/item_order_details_entity.dart';
import 'package:tracking_app/features/home/presentation/view_model/pending_order/pending_order_cubit.dart';
import 'package:tracking_app/features/home/presentation/widgets/item_pending_order.dart';

class PendingOrderScreen extends StatelessWidget {
  const PendingOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<PendingOrderCubit>(
        create: (context) => serviceLocator<PendingOrderCubit>()..getAllPendingOrder(),
        child: BlocBuilder<PendingOrderCubit, PendingOrderState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Skeletonizer(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) =>
                      const ItemPendingOrder(orderEntity: OrderEntity()),
                  separatorBuilder: (context, index) => const SizedBox(height: 24),
                  itemCount: 6,
                ),
              );
            }
            if (state.isSuccess) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) => ItemPendingOrder(
                  orderEntity: state.orders[index],
                  onPressedAccept: () {},
                  onPressedReject: () async {
                    await context.read<PendingOrderCubit>().getAllPendingOrder();
                  },
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 24),
                itemCount: state.orders.length,
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
