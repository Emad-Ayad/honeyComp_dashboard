import 'dart:io';

class AddProductInputEntity {
  final String name, code, description;
  final num price;
  final bool isFeatured;
  final File image;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic ;
  final int numOfCalories;
  final num avgRate = 0;
  final num ratingCount = 0 ;
  final int unitAmount;

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
      this.isOrganic=false,
      this.imageUrl});
}
