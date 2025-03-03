import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_entities.dart';

import '../../errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct(
      AddProductEntitites addProductInputEntity);
}
