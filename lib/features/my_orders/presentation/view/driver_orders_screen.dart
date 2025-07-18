import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/di/service_locator.dart';
import 'package:tracking_app/core/dialogs/app_dialogs.dart';
import 'package:tracking_app/core/theme/app_theme.dart';
import 'package:tracking_app/features/my_orders/presentation/view/my_order_details.dart';
import 'package:tracking_app/features/my_orders/presentation/view_model/driver_orders_cubit.dart';
import 'package:tracking_app/features/my_orders/presentation/view_model/driver_orders_state.dart';
import 'package:tracking_app/features/my_orders/presentation/widgets/item_my_order.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  final DriverOrdersCubit driverOrdersCubit = serviceLocator<DriverOrdersCubit>();

  @override
  void initState() {
    super.initState();
    driverOrdersCubit.getAllDriverOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => driverOrdersCubit,
      child: BlocListener<DriverOrdersCubit, DriverOrdersState>(
        listener: (context, state) {
          if (state is DriverOrdersError) {
            AppDialogs.showFailureDialog(
              context,
              message: state.message,
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('My orders',
              style:AppTheme.lightTheme.textTheme. titleLarge
            ),
            leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new),onPressed: () => Navigator.pop(context),),
          ),
          body: BlocBuilder<DriverOrdersCubit, DriverOrdersState>(
            builder: (context, state) {
              if (state is DriverOrdersLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DriverOrdersSuccess) {
                final allOrders = state.filteredOrders?? [];
                if (allOrders.isEmpty) {
                  return const Center(child: Text('لا توجد طلبات حالياً.'));
                }

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Recent orders',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 80,
                            width: 170,
                             decoration: BoxDecoration(
                               color: AppColors.lightPink.withOpacity(0.5),
                               borderRadius: BorderRadius.circular(8),
                             ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start ,
                                children: [
                                  Text('${state.cancelledCount }',
                                      style:AppTheme.lightTheme.textTheme. titleSmall?.copyWith(fontSize: 18),),
                                  SizedBox(height: 4),

                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.red,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'cancelled',
                                          style:AppTheme.lightTheme.textTheme. titleSmall
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            height: 80,
                            width: 170,
                            decoration: BoxDecoration(
                              color: AppColors.lightPink.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets. symmetric(horizontal: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start ,
                                children: [
                                  Text('${state.completedCount}',
                                      style:AppTheme.lightTheme.textTheme. titleSmall?.copyWith(fontSize: 18)),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.check_circle_outline_rounded,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'completed',
                                        style:AppTheme.lightTheme.textTheme. titleSmall
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: ListView.separated(
                          itemCount: allOrders.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            final order = allOrders[index];
                            final orderStatus = order.order?.state ?? '';
                            final statusColor = orderStatus.toLowerCase() == 'canceled'
                                ? Colors.red
                                : Colors.green;
                            final icon = orderStatus.toLowerCase() == 'canceled'
                                ? Icon(Icons.cancel_outlined, color: Colors.red)
                                : Icon( Icons.check_circle_outline_rounded, color: Colors.green);

                            return ItemMyOrder(icons: icon,
                              icon: icon,
                              orderId: order.order?.orderNumber ?? '',
                              orderStatus: orderStatus,
                              userLastName: order.order?.user?.lastName ?? '',
                              userLatLong: order.store?.latLong ?? '',
                              userImage: order.order?.user?.photo ?? '',
                              userName: order.order?.user?.firstName ?? '',
                              storeName: order.store?.name ?? '',
                              storeLatLong: order.store?.latLong ?? '',
                              storeImage: order.store?.image ?? '',
                              statusColor: statusColor,
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider.value(
                                      value: driverOrdersCubit,
                                      child: MyOrderDetailsScreen(
                                        order: allOrders[index],
                                      ),
                                    ),
                                  ),
                                );
                              },

                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
