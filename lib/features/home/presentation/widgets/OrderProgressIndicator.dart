import 'package:flutter/material.dart';


enum OrderStatus {
  accepted,
  preparing,
  onTheWay,
  delivered,
  completed,
}
class OrderProgressIndicator extends StatelessWidget {
   OrderProgressIndicator({super.key, required this.currentStatus});
  final OrderStatus currentStatus;

  int getCurrentStep() {
    switch (currentStatus) {
      case OrderStatus.accepted:
        return 0;
      case OrderStatus.preparing:
        return 1;
      case OrderStatus.onTheWay:
        return 2;
      case OrderStatus.delivered:
        return 3;
      case OrderStatus.completed:
        return 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    final steps = ['Accepted', 'Preparing', 'On the way', 'Delivered', 'Completed'];
    final currentStep = getCurrentStep();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(steps.length, (index) {
            final isActive = index <= currentStep;
            return Expanded(
              child: Column(
                children: [
                  Container(
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: isActive ? Colors.green : Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),

                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
