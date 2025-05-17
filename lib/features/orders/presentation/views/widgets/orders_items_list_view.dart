import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/data/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_item.dart';

class OrdersItemsListView extends StatelessWidget {
  const OrdersItemsListView({super.key, required this.orderEntity});

  final List<OrderEntity> orderEntity;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderEntity.length,
      itemBuilder: (context, index) {
        return OrderItem(orderEntity: orderEntity[index]);
      },
    );
  }
}
