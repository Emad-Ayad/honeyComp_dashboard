import 'dart:io';

import 'package:honey_comp_dashboard/features/add_product/data/models/review_model.dart';
import 'package:honey_comp_dashboard/features/add_product/domain/add_product_input_entity.dart';

class AddProductInputModel {
  final String name, code, description;
  final num price;
  final bool isFeatured;
  final File image;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;

  final int numOfCalories;
  final num avgRate = 0;
  final num ratingCount = 0;

  final int unitAmount;
  final List<ReviewModel> reviews;

  AddProductInputModel(
      {required this.name,
      required this.code,
      required this.description,
      required this.isFeatured,
      required this.price,
      required this.image,
      required this.expirationMonths,
      required this.numOfCalories,
      required this.unitAmount,
      required this.isOrganic,
      required this.reviews,
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
      expirationMonths: addProductInputEntity.expirationMonths,
      numOfCalories: addProductInputEntity.numOfCalories,
      isOrganic: addProductInputEntity.isOrganic,
      unitAmount: addProductInputEntity.unitAmount,
      reviews: addProductInputEntity.reviews
          .map((e) => ReviewModel.fromEntity(e))
          .toList(),
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
      "expirationMonths": expirationMonths,
      "numOfCalories": numOfCalories,
      "unitAmount": unitAmount,
      "isOrganic": isOrganic,
      "reviews": reviews.map((e) => e.toJson()).toList()
    };
  }
}
