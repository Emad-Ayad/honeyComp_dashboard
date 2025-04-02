import 'package:dartz/dartz.dart';
import 'package:honey_comp_dashboard/core/errors/failure.dart';
import 'package:honey_comp_dashboard/features/add_product/domain/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure,void>> addProduct(AddProductInputEntity addProductInputEntity);
}
