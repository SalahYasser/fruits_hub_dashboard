import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
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
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var data in dataBaseService.streamData(
        path: BackendEndpoint.getOrders,
      )) {
        List<OrderEntity> orders =
            (data as List<dynamic>)
                .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
                .toList();

        yield Right(orders);
      }
    } catch (e) {
      yield Left(ServerFailure('Failed to fetch orders'));
    }
  }

  @override
  Future<Either<Failure, void>> updateOrder(
    OrderStatusEnum orderStatusEnum,
    String orderId,
  ) async {
    try {
      await dataBaseService.updateData(
        data: {'status': orderStatusEnum.name},
        path: BackendEndpoint.updateOrders,
        documentId: orderId,
      );
      return Future.value(Right(null));
    } catch (e) {
      return Future.value(Left(ServerFailure('Failed to update order')));
    }
  }
}
