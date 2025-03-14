import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manger/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import '../../../../core/helper_functions/build_app_bar.dart';
import '../../domain/repos/orders_repo.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  static const String routeName = 'orders';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchOrdersCubit(
          getIt.get<OrdersRepo>(),
      ),
      child: Scaffold(
          appBar: buildAppBar('Orders'),
          body: const OrdersViewBody(),
      ),
    );
  }
}
