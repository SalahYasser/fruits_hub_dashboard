import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/build_error_bar.dart';
import '../../../../../core/widgets/custom_progress_hud.dart';
import '../../manger/update_order_cubit/update_order_cubit.dart';

class UpdateOrderBuilder extends StatelessWidget {
  const UpdateOrderBuilder({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      listener: (context, state) {
        if (state is UpdateOrderSuccess) {
          buildBar(context, 'Order updated successfully');
        }
        if (state is UpdateOrderFailure) {
          buildBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is UpdateOrderLoading,
          child: child,
        );
      },
    );
  }
}
