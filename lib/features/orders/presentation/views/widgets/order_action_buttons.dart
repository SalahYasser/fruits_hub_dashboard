import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manger/update_order_cubit/update_order_cubit.dart';

import '../../../../../core/enums/order_enum.dart';
import '../../../domain/entities/data/order_entity.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                orderStatusEnum: OrderStatusEnum.accepted,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text('Accept'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                orderStatusEnum: OrderStatusEnum.cancelled,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text('Reject'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.accepted,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                orderStatusEnum: OrderStatusEnum.delivered,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text('Delivered'),
          ),
        ),
      ],
    );
  }
}
