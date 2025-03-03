import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/repos/product_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/sevices/data_service.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/models/add_product_input_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_entities.dart';

import '../../errors/failures.dart';
import '../../unitls/backend_endpoint.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, void>> addProduct(
      AddProductEntitites addProductInputEntity) async {
    try {
      await databaseService.addData(
        path: BackendEndpoint.productsCollection,
        data: AddProductModels.fromEntity(addProductInputEntity).tojson(),
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product'));
    }
  }
}
