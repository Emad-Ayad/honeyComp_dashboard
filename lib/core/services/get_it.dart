import 'package:get_it/get_it.dart';
import 'package:honey_comp_dashboard/core/services/storage_service.dart';

import 'fire_storage.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<StorageService>(FireStorage());
}
