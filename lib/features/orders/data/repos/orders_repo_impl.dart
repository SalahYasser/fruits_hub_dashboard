import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/backend_endpoint.dart';
import '../../domain/entities/data/order_entity.dart';
import '../../domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {

  final DataBaseService dataBaseService;

  OrdersRepoImpl(this.dataBaseService);

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
     final data = await dataBaseService.getData(path: BackendEndpoint.getOrders);

      List<OrderEntity> orders = (data as List<dynamic>)
          .map((e) => OrderModel.fromJson(e).toEntity())
          .toList() as List<OrderEntity>;

      return Right(orders);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch orders'));
    }
  }
}