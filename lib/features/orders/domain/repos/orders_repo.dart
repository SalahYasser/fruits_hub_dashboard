import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/data/order_entity.dart';

abstract class OrdersRepo {

  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();

  Future<Either<Failure, void>> updateOrder(
    OrderStatusEnum orderStatusEnum, String orderId);
}
