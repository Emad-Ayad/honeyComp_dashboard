import 'package:dartz/dartz.dart';
import 'package:honey_comp_dashboard/core/helper/backend_endpoints.dart';
import 'package:honey_comp_dashboard/core/repoes/product_repo/products_repo.dart';
import 'package:honey_comp_dashboard/core/services/database_service.dart';
import 'package:honey_comp_dashboard/features/add_product/data/models/add_product_input_model.dart';
import 'package:honey_comp_dashboard/features/add_product/domain/add_product_input_entity.dart';

import '../../errors/failure.dart';

class ProductsRepoImplementation implements ProductsRepo {
  final DataBaseService dataBaseService;

  ProductsRepoImplementation({required this.dataBaseService});

  @override
  Future<Either<Failure, void>> addProduct(
      AddProductInputEntity addProductInputEntity) async {
    try {
      await dataBaseService.addData(
          path: BackendEnpPoints.addProductsEndPoint,
          data:
               AddProductInputModel.fromEntity(addProductInputEntity).toJson());
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(errMessage: "Failed to add product"));
    }
  }
}
