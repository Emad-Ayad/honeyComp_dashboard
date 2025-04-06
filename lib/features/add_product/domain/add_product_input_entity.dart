import 'dart:io';

import 'package:honey_comp_dashboard/features/add_product/domain/review_entity.dart';

class AddProductInputEntity {
  final String name, code, description;
  final num price;
  final bool isFeatured;
  final File image;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;

  final int numOfCalories;
  final int unitAmount;
  final List<ReviewEntity> reviews;

  AddProductInputEntity(
      {required this.name,
      required this.code,
      required this.description,
      required this.isFeatured,
      required this.price,
      required this.image,
      required this.expirationMonths,
      required this.numOfCalories,
      required this.unitAmount,
      required this.reviews,
      this.isOrganic = false,
      this.imageUrl});
}
