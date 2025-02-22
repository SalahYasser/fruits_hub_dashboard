import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';

import '../../../features/add_product/data/models/ProductModel.dart';
import '../../../features/add_product/domain/entities/add_product_input/ProductEntity.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DataBaseService dataBaseService;

  ProductsRepoImpl(this.dataBaseService);

  @override
  Future<Either<Failure, void>> addProduct(
    ProductEntity addProductInputEntity,
  ) async {
    try {
      await dataBaseService.addData(
        path: BackendEndpoint.addProductCollection,
        data: ProductModel.fromEntity(addProductInputEntity).toJson(),
      );

      return const Right(null);
    } catch (e) {
      return left(ServerFailure('Failed to add product'));
    }
  }
}
