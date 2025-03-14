import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper_functions/get_order_dummy_data.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../manger/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'orders_view_body.dart';

class OrdersViewBodyBlocBuilder extends StatefulWidget {
  const OrdersViewBodyBlocBuilder({super.key});

  @override
  State<OrdersViewBodyBlocBuilder> createState() => _OrdersViewBodyBlocBuilderState();
}

class _OrdersViewBodyBlocBuilderState extends State<OrdersViewBodyBlocBuilder> {

  @override
  void initState() {
    context.read<FetchOrdersCubit>().fetchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrdersViewBody(orders: state.orders);
        } else if (state is FetchOrdersFailure) {
          return CustomErrorWidget(text: state.errMessage);
        } else {
          return Skeletonizer(
            child: OrdersViewBody(
              orders: [
                getDummyOrder(),
                getDummyOrder(),
              ],
            ),
          );
        }
      },
    );
  }
}
