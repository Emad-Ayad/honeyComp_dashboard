import 'dart:io';

import 'package:honey_comp_dashboard/features/add_product/domain/add_product_input_entity.dart';

class AddProductInputModel {
  final String name, code, description;
  final num price;
  final bool isFeatured;
  final File image;
  String? imageUrl;

  AddProductInputModel(
      {required this.name,
      required this.code,
      required this.description,
      required this.isFeatured,
      required this.price,
      required this.image,
      this.imageUrl});

  factory AddProductInputModel.fromEntity(
      AddProductInputEntity addProductInputEntity) {
    return AddProductInputModel(
        name: addProductInputEntity.name,
        code: addProductInputEntity.code,
        description: addProductInputEntity.description,
        isFeatured: addProductInputEntity.isFeatured,
        price: addProductInputEntity.price,
        image: addProductInputEntity.image,
        imageUrl: addProductInputEntity.imageUrl,
    );
  }

  toJson() {
    return {
      "name": name,
      "code": code,
      "description": description,
      'isFeatured': isFeatured,
      "price": price,
      "imageUrl": imageUrl,
    };
  }

}
