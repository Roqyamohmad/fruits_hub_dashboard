import 'package:fruits_hub_dashboard/core/repos/images_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/image_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/sevices/data_service.dart';
import 'package:fruits_hub_dashboard/core/sevices/file_storage.dart';
import 'package:fruits_hub_dashboard/core/sevices/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/sevices/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetit() {
  getIt.registerSingleton<StorageService>(FileStorage());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt
      .registerSingleton<ImageRepo>(ImageRepoImpl(getIt.get<StorageService>()));
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(
      getIt.get<DatabaseService>(),
    ),
  );
}
