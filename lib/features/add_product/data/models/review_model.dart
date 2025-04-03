import 'package:honey_comp_dashboard/features/add_product/domain/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String date;
  final String review;
  final num ratting;

  ReviewModel({
    required this.name,
    required this.image,
    required this.date,
    required this.ratting,
    required this.review,
  });

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      date: reviewEntity.date,
      ratting: reviewEntity.ratting,
      review: reviewEntity.review,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      date: json['date'],
      ratting: json['ratting'],
      review: json['review'],
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'ratting': ratting,
      'review': review,
    };
  }
}
