import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

import 'fire_storage.dart';

final getIt = GetIt.instance;

void setupGetIt() {

  getIt.registerSingleton<StorageService>(FireStorage());


}
