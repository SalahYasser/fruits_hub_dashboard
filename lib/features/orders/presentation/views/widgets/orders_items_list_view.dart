import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_item.dart';

import '../../../../../core/helper_functions/get_order_dummy_data.dart';

class OrdersItemsListView extends StatelessWidget {
  const OrdersItemsListView({super.key, required this.orderModels});

  final List<OrderModel> orderModels;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orderModels.length,
      itemBuilder: (context, index) {
        return OrderItem(orderModel: getDummyOrder());
      },
    );
  }
}
