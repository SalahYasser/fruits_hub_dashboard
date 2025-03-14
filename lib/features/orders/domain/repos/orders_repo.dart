import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/data/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderEntity>>> fetchOrders();
}