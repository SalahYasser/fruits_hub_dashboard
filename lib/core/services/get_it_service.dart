import 'package:fruits_hub_dashboard/core/repos/image_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/image_repo/images_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_storage_service.dart';
import 'package:fruits_hub_dashboard/features/orders/data/repos/orders_repo_impl.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:get_it/get_it.dart';
import '../repos/product_repo/products_repo.dart';
import '../repos/product_repo/products_repo_impl.dart';
import 'fire_storage.dart';
import 'firestore_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {

  getIt.registerSingleton<StorageService>(FireStorage());

  // getIt.registerSingleton<StorageService>(SupabaseStorageService());

  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(getIt.get<StorageService>()),
  );


  getIt.registerSingleton<DataBaseService>(FireStoreService());

  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(getIt.get<DataBaseService>()),
  );


  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(getIt.get<DataBaseService>()),
  );
}
