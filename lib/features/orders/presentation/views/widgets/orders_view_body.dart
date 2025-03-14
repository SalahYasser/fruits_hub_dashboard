import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_items_list_view.dart';
import '../../../domain/entities/data/order_entity.dart';
import 'filter_section.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});

  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 24),
          FilterSection(),
          SizedBox(height: 24),
          Expanded(
              child: OrdersItemsListView(
                  orderEntity: orders,
              ),
          ),
        ],
      ),
    );
  }
}
