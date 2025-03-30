import 'package:honey_comp_dashboard/features/add_product/domain/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<void> addProduct(AddProductInputEntity addProductInputEntity);
}
