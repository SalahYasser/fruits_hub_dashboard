import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';

import '../../../../core/helper_functions/build_app_bar.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const String routeName = 'orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Orders'),
      body: OrdersViewBody(),
    );
  }
}
