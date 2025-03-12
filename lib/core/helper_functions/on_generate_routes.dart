import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/dashboard/views/dashboard_view.dart';

import '../../features/add_product/presentation/views/add_product_view.dart';
import '../../features/orders/presentation/views/orders_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {

    case OrdersView.routeName:
      return MaterialPageRoute(builder: (context) => const OrdersView());

    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductView());

    case DashboardView.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
