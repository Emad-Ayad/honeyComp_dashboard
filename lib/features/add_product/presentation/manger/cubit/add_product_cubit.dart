import 'package:bloc/bloc.dart';
import 'package:honey_comp_dashboard/core/repoes/product_repo/products_repo.dart';
import 'package:honey_comp_dashboard/core/repoes/upload_image_repo/upload_img_repo.dart';
import 'package:honey_comp_dashboard/features/add_product/domain/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productsRepo)
      : super(AddProductInitial());

  final ImageRepo imageRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imageRepo.uploadImage(addProductInputEntity.image);

    result.fold(
      (f) => emit(AddProductFailure(errMsg: f.errMessage)),
      (url) async {
        addProductInputEntity.imageUrl = url;
        var result = await productsRepo.addProduct(addProductInputEntity);
        result.fold(
          (f) => emit(AddProductFailure(errMsg: f.errMessage)),
          (r) => emit(AddProductSuccess()),
        );
      },
    );
  }
}
