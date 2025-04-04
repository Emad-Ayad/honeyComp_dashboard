import 'package:get_it/get_it.dart';
import 'package:honey_comp_dashboard/core/repoes/product_repo/products_repo.dart';
import 'package:honey_comp_dashboard/core/repoes/product_repo/products_repo_impl.dart';
import 'package:honey_comp_dashboard/core/repoes/upload_image_repo/upload_img_repo.dart';
import 'package:honey_comp_dashboard/core/repoes/upload_image_repo/upload_img_repo_impl.dart';
import 'package:honey_comp_dashboard/core/services/database_service.dart';
import 'package:honey_comp_dashboard/core/services/firestore_service.dart';
import 'package:honey_comp_dashboard/core/services/storage_service.dart';
import 'package:honey_comp_dashboard/core/services/supabase_storage_service.dart';

import 'fire_storage.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<StorageService>(SupabaseStorageService());
  getIt.registerSingleton<DataBaseService>(FirestoreService());

  getIt.registerSingleton<ImageRepo>(
      ImageRepoImpl(storageService: getIt.get<StorageService>()));

  getIt.registerSingleton<ProductsRepo>(ProductsRepoImplementation(
      dataBaseService: getIt.get<DataBaseService>()));
}
