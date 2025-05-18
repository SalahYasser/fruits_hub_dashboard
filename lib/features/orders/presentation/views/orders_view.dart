import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manger/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manger/update_order_cubit/update_order_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body_bloc_builder.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/update_order_builder.dart';
import '../../../../core/helper_functions/build_app_bar.dart';
import '../../domain/repos/orders_repo.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const routeName = 'orders';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchOrdersCubit(getIt.get<OrdersRepo>()),
        ),
        BlocProvider(
          create: (context) => UpdateOrderCubit(getIt.get<OrdersRepo>()),
        ),
      ],
      child: Scaffold(
        appBar: buildAppBar('Orders'),
        body: const UpdateOrderBuilder(
            child: OrdersViewBodyBlocBuilder()
        ),
      ),
    );
  }
}
