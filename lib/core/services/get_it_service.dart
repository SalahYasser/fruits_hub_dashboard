import 'package:fruits_hub_dashboard/core/repos/image_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/image_repo/images_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/services/supabase_storage_service.dart';
import 'package:get_it/get_it.dart';
import '../repos/product_repo/products_repo.dart';
import '../repos/product_repo/products_repo_impl.dart';
import 'firestore_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {

  // getIt.registerSingleton<StorageService>(FireStorage());

  getIt.registerSingleton<StorageService>(SupabaseStorageService());

  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(getIt.get<StorageService>()),
  );


  getIt.registerSingleton<DataBaseService>(FirestoreService());

  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(getIt.get<DataBaseService>()),
  );
}
