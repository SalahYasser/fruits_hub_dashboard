import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_items_list_view.dart';
import '../../../../../core/helper_functions/get_order_dummy_data.dart';
import 'filter_section.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

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
              orderEntity: [
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
