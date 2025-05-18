import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/enums/order_enum.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.ordersRepo) : super(UpdateOrderInitial());

  final OrdersRepo ordersRepo;

  Future<void> updateOrder({
    required OrderStatusEnum orderStatusEnum,
    required String orderId,
  }) async {

    emit(UpdateOrderLoading());

    final result = await ordersRepo.updateOrder(
      orderStatusEnum: orderStatusEnum,
      orderId: orderId,
    );
    result.fold(
      (f) {
        emit(UpdateOrderFailure(f.message));
      },
      (r) {
        emit(UpdateOrderSuccess());
      },
    );
  }
}
