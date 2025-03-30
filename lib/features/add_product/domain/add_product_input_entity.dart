import 'dart:io';

class AddProductInputEntity {
  final String name, code, description;
  final num price;
  final bool isFeatured;
  final File? image;
  final String? imageUrl;

  AddProductInputEntity(
      {required this.name,
      required this.code,
      required this.description,
      required this.isFeatured,
      required this.price,
      this.image,
      this.imageUrl});
}
